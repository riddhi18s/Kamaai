import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/kaam_entry_model.dart';
import '../../data/models/kaam_entry_type.dart';
import 'kaam_khata_providers.dart';

class NayaKaamFormState {
  const NayaKaamFormState({
    this.type = KaamEntryType.daily,
    this.amount = 0,
    this.date,
    this.periodStart,
    this.periodEnd,
    this.location,
    this.isSaving = false,
    this.error,
  });

  final KaamEntryType type;
  final double amount;
  final DateTime? date;
  final DateTime? periodStart;
  final DateTime? periodEnd;
  final String? location;
  final bool isSaving;
  final String? error;

  NayaKaamFormState copyWith({
    KaamEntryType? type,
    double? amount,
    DateTime? date,
    DateTime? periodStart,
    DateTime? periodEnd,
    String? location,
    bool? isSaving,
    String? error,
  }) {
    return NayaKaamFormState(
      type: type ?? this.type,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      periodStart: periodStart ?? this.periodStart,
      periodEnd: periodEnd ?? this.periodEnd,
      location: location ?? this.location,
      isSaving: isSaving ?? this.isSaving,
      error: error,
    );
  }
}

/// Manages the "Naya Kaam Darj" form: entry type, amount, date(s), and
/// location, plus submission to [KaamKhataRepository].
class NayaKaamFormNotifier extends Notifier<NayaKaamFormState> {
  @override
  NayaKaamFormState build() {
    final now = DateTime.now();
    return NayaKaamFormState(date: now, periodStart: now, periodEnd: now);
  }

  void setType(KaamEntryType type) => state = state.copyWith(type: type);

  void setAmount(double amount) => state = state.copyWith(amount: amount);

  void setDate(DateTime date) => state = state.copyWith(date: date);

  void setPeriodStart(DateTime date) =>
      state = state.copyWith(periodStart: date);

  void setPeriodEnd(DateTime date) =>
      state = state.copyWith(periodEnd: date);

  void setLocation(String location) =>
      state = state.copyWith(location: location);

  bool get isValid {
    if (state.amount <= 0) return false;
    if (state.type == KaamEntryType.daily) return state.date != null;
    return state.periodStart != null &&
        state.periodEnd != null &&
        !state.periodEnd!.isBefore(state.periodStart!);
  }

  Future<bool> submit() async {
    if (!isValid) return false;

    state = state.copyWith(isSaving: true, error: null);
    try {
      final repo = ref.read(kaamKhataRepositoryProvider);
      final id = DateTime.now().microsecondsSinceEpoch.toString();

      final entry = KaamEntryModel(
        id: id,
        type: state.type,
        amount: state.amount,
        date:
            state.type == KaamEntryType.daily ? state.date! : state.periodStart!,
        periodStart:
            state.type == KaamEntryType.fixed ? state.periodStart : null,
        periodEnd: state.type == KaamEntryType.fixed ? state.periodEnd : null,
        location: state.location,
        createdAt: DateTime.now(),
      );

      await repo.saveEntry(entry);
      reset();
      return true;
    } catch (e) {
      state = state.copyWith(isSaving: false, error: e.toString());
      return false;
    }
  }

  void reset() {
    final now = DateTime.now();
    state = NayaKaamFormState(date: now, periodStart: now, periodEnd: now);
  }
}

final nayaKaamFormProvider =
    NotifierProvider<NayaKaamFormNotifier, NayaKaamFormState>(
  NayaKaamFormNotifier.new,
);
