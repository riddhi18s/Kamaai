import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/kaam_entry_model.dart';
import '../../data/models/kaam_entry_type.dart';
import '../../data/repositories/kaam_khata_repository.dart';

final kaamKhataRepositoryProvider = Provider<KaamKhataRepository>((ref) {
  return KaamKhataRepository();
});

/// The month currently shown on the Kaam Khata home + Itihaas screens.
final selectedKaamMonthProvider = StateProvider<DateTime>((ref) {
  final now = DateTime.now();
  return DateTime(now.year, now.month);
});

/// Live entries for [selectedKaamMonthProvider]. Firestore-backed with an
/// instant first paint from the local Hive cache, so the screen never
/// sits on a bare loading spinner when data already exists offline.
final kaamEntriesProvider =
    StreamProvider.autoDispose<List<KaamEntryModel>>((ref) async* {
  final repo = ref.watch(kaamKhataRepositoryProvider);
  final month = ref.watch(selectedKaamMonthProvider);

  final cached = await repo.readLocalEntries();
  yield cached
      .where(
        (e) => e.date.year == month.year && e.date.month == month.month,
      )
      .toList();

  yield* repo.watchEntriesForMonth(month).handleError((_) {});
});

/// Every entry ever cached locally, regardless of month — used for
/// all-time calculations like the income certificate's average.
final allKaamEntriesProvider =
    FutureProvider.autoDispose<List<KaamEntryModel>>((ref) async {
  final repo = ref.watch(kaamKhataRepositoryProvider);
  return repo.readLocalEntries();
});

class KaamKhataStats {
  const KaamKhataStats({
    required this.todayEarning,
    required this.monthTotal,
    required this.daysWorked,
    required this.dailyAverage,
    required this.mahavariCount,
  });

  final double todayEarning;
  final double monthTotal;
  final int daysWorked;
  final double dailyAverage;
  final int mahavariCount;
}

/// Derives dashboard stats (today's earning, month total, days worked,
/// daily average, fixed/Mahavari entry count) from the selected month's
/// entries.
final kaamKhataStatsProvider = Provider.autoDispose<KaamKhataStats>((ref) {
  final entries = ref.watch(kaamEntriesProvider).valueOrNull ??
      const <KaamEntryModel>[];

  final today = DateTime.now();
  double todayEarning = 0;
  double monthTotal = 0;
  final workedDays = <DateTime>{};
  int mahavariCount = 0;

  for (final entry in entries) {
    monthTotal += entry.amount;

    if (entry.type == KaamEntryType.fixed) {
      mahavariCount++;
    }

    if (entry.type == KaamEntryType.daily &&
        entry.date.year == today.year &&
        entry.date.month == today.month &&
        entry.date.day == today.day) {
      todayEarning += entry.amount;
    }

    if (entry.type == KaamEntryType.daily) {
      workedDays
          .add(DateTime(entry.date.year, entry.date.month, entry.date.day));
    } else if (entry.periodStart != null && entry.periodEnd != null) {
      for (var d = entry.periodStart!;
          !d.isAfter(entry.periodEnd!);
          d = d.add(const Duration(days: 1))) {
        workedDays.add(DateTime(d.year, d.month, d.day));
      }
    }
  }

  final daysWorked = workedDays.length;
  final average = daysWorked == 0 ? 0.0 : monthTotal / daysWorked;

  return KaamKhataStats(
    todayEarning: todayEarning,
    monthTotal: monthTotal,
    daysWorked: daysWorked,
    dailyAverage: average,
    mahavariCount: mahavariCount,
  );
});

/// Calendar days (in the selected month) that have at least one recorded
/// entry — used by [KamaiCalendar] to highlight income days in green.
final kaamIncomeDaysProvider = Provider.autoDispose<Set<int>>((ref) {
  final entries =
      ref.watch(kaamEntriesProvider).valueOrNull ?? const <KaamEntryModel>[];
  final days = <int>{};

  for (final entry in entries) {
    if (entry.type == KaamEntryType.daily) {
      days.add(entry.date.day);
    } else if (entry.periodStart != null && entry.periodEnd != null) {
      for (var d = entry.periodStart!;
          !d.isAfter(entry.periodEnd!);
          d = d.add(const Duration(days: 1))) {
        if (d.month == entry.periodStart!.month) days.add(d.day);
      }
    }
  }
  return days;
});

/// All-time average *monthly* income (total earned per calendar month,
/// averaged across every month with at least one entry). Powers the
/// self-declared income certificate.
final averageMonthlyIncomeProvider = Provider.autoDispose<double>((ref) {
  final entries =
      ref.watch(allKaamEntriesProvider).valueOrNull ?? const <KaamEntryModel>[];
  if (entries.isEmpty) return 0;

  final byMonth = <String, double>{};
  for (final e in entries) {
    final key = '${e.date.year}-${e.date.month}';
    byMonth[key] = (byMonth[key] ?? 0) + e.amount;
  }

  final total = byMonth.values.fold<double>(0, (a, b) => a + b);
  return total / byMonth.length;
});
