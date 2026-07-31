/// The two kinds of income entries a worker can record in Kaam Khata:
/// a single day's earning ("Roz ki kamai") or a fixed/period-based
/// earning that spans a date range ("Mahavari / Fixed").
enum KaamEntryType { daily, fixed }

extension KaamEntryTypeX on KaamEntryType {
  String get storageValue => this == KaamEntryType.daily ? 'daily' : 'fixed';

  static KaamEntryType fromStorageValue(String value) {
    return value == 'fixed' ? KaamEntryType.fixed : KaamEntryType.daily;
  }
}
