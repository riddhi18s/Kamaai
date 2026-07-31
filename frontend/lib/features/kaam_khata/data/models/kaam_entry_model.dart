import 'package:cloud_firestore/cloud_firestore.dart';

import 'kaam_entry_type.dart';

/// A single income record in Kaam Khata. Either a one-day "daily" entry
/// (uses [date]) or a "fixed" / Mahavari entry spanning [periodStart] to
/// [periodEnd].
class KaamEntryModel {
  const KaamEntryModel({
    required this.id,
    required this.type,
    required this.amount,
    required this.date,
    this.periodStart,
    this.periodEnd,
    this.location,
    required this.createdAt,
  });

  final String id;
  final KaamEntryType type;
  final double amount;

  /// For [KaamEntryType.daily] this is the day the work was done. For
  /// [KaamEntryType.fixed] this mirrors [periodStart] so the entry can
  /// still be sorted/filtered by a single date field.
  final DateTime date;

  final DateTime? periodStart;
  final DateTime? periodEnd;
  final String? location;
  final DateTime createdAt;

  bool get isFixed => type == KaamEntryType.fixed;

  /// Number of calendar days this entry represents — 1 for a daily entry,
  /// or the full span for a fixed/Mahavari entry. Used for stats math.
  int get spanDays {
    if (!isFixed || periodStart == null || periodEnd == null) return 1;
    return periodEnd!.difference(periodStart!).inDays + 1;
  }

  KaamEntryModel copyWith({
    String? id,
    KaamEntryType? type,
    double? amount,
    DateTime? date,
    DateTime? periodStart,
    DateTime? periodEnd,
    String? location,
    DateTime? createdAt,
  }) {
    return KaamEntryModel(
      id: id ?? this.id,
      type: type ?? this.type,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      periodStart: periodStart ?? this.periodStart,
      periodEnd: periodEnd ?? this.periodEnd,
      location: location ?? this.location,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  // ---------------------------------------------------------------------
  // Firestore (Timestamp-based)
  // ---------------------------------------------------------------------

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type.storageValue,
      'amount': amount,
      'date': Timestamp.fromDate(date),
      'periodStart':
          periodStart != null ? Timestamp.fromDate(periodStart!) : null,
      'periodEnd': periodEnd != null ? Timestamp.fromDate(periodEnd!) : null,
      'location': location,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }

  factory KaamEntryModel.fromMap(Map<String, dynamic> map) {
    DateTime toDate(dynamic value) {
      if (value is Timestamp) return value.toDate();
      if (value is String) return DateTime.parse(value);
      return DateTime.now();
    }

    return KaamEntryModel(
      id: map['id'] as String,
      type: KaamEntryTypeX.fromStorageValue(
        map['type'] as String? ?? 'daily',
      ),
      amount: (map['amount'] as num).toDouble(),
      date: toDate(map['date']),
      periodStart:
          map['periodStart'] != null ? toDate(map['periodStart']) : null,
      periodEnd: map['periodEnd'] != null ? toDate(map['periodEnd']) : null,
      location: map['location'] as String?,
      createdAt:
          map['createdAt'] != null ? toDate(map['createdAt']) : DateTime.now(),
    );
  }

  // ---------------------------------------------------------------------
  // Hive local cache (ISO-8601 string based — plain Map, no TypeAdapter
  // registration required)
  // ---------------------------------------------------------------------

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.storageValue,
      'amount': amount,
      'date': date.toIso8601String(),
      'periodStart': periodStart?.toIso8601String(),
      'periodEnd': periodEnd?.toIso8601String(),
      'location': location,
      'createdAt': createdAt.toIso8601String(),
      'synced': false,
    };
  }

  factory KaamEntryModel.fromJson(Map<dynamic, dynamic> json) {
    return KaamEntryModel(
      id: json['id'] as String,
      type: KaamEntryTypeX.fromStorageValue(
        json['type'] as String? ?? 'daily',
      ),
      amount: (json['amount'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
      periodStart: json['periodStart'] != null
          ? DateTime.parse(json['periodStart'] as String)
          : null,
      periodEnd: json['periodEnd'] != null
          ? DateTime.parse(json['periodEnd'] as String)
          : null,
      location: json['location'] as String?,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : DateTime.now(),
    );
  }
}
