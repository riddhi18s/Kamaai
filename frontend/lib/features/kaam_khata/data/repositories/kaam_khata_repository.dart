import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/kaam_entry_model.dart';

/// Offline-first data source for Kaam Khata income entries.
///
/// Every write lands in a local Hive box immediately (so the UI never
/// blocks on connectivity), then gets pushed to Firestore in the
/// background. [syncPending] can be called any time (e.g. on connectivity
/// regain) to retry anything that failed to sync earlier.
class KaamKhataRepository {
  KaamKhataRepository({
    FirebaseFirestore? firestore,
    FirebaseAuth? auth,
  })  : _firestore = firestore ?? FirebaseFirestore.instance,
        _auth = auth ?? FirebaseAuth.instance;

  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  static const String _hiveBoxName = 'kaam_khata_entries';

  String? get _uid => _auth.currentUser?.uid;

  CollectionReference<Map<String, dynamic>> _collection(String uid) {
    return _firestore
        .collection('users')
        .doc(uid)
        .collection('kaam_khata_entries');
  }

  Future<Box> _openBox() async {
    if (Hive.isBoxOpen(_hiveBoxName)) {
      return Hive.box(_hiveBoxName);
    }
    return Hive.openBox(_hiveBoxName);
  }

  /// Saves an entry: writes immediately to the local Hive cache, then
  /// syncs to Firestore in the background. If the Firestore write fails
  /// (e.g. no internet) the entry stays flagged `synced: false` in Hive
  /// and will be retried by [syncPending].
  Future<void> saveEntry(KaamEntryModel entry) async {
    final box = await _openBox();
    await box.put(entry.id, entry.toJson());

    final uid = _uid;
    if (uid == null) return;

    try {
      await _collection(uid).doc(entry.id).set(entry.toMap());
      final cached = Map<String, dynamic>.from(box.get(entry.id) as Map);
      cached['synced'] = true;
      await box.put(entry.id, cached);
    } catch (_) {
      // Left unsynced in Hive; syncPending() will retry later.
    }
  }

  Future<void> deleteEntry(String id) async {
    final box = await _openBox();
    await box.delete(id);

    final uid = _uid;
    if (uid == null) return;

    try {
      await _collection(uid).doc(id).delete();
    } catch (_) {
      // If offline, the remote doc simply stays until a retry.
    }
  }

  /// Retries pushing every locally-cached entry not yet confirmed synced
  /// with Firestore. Safe to call repeatedly.
  Future<void> syncPending() async {
    final uid = _uid;
    if (uid == null) return;

    final box = await _openBox();
    for (final key in box.keys) {
      final raw = box.get(key);
      if (raw is! Map) continue;
      final map = Map<dynamic, dynamic>.from(raw);
      if (map['synced'] == true) continue;

      try {
        final entry = KaamEntryModel.fromJson(map);
        await _collection(uid).doc(entry.id).set(entry.toMap());
        map['synced'] = true;
        await box.put(key, map);
      } catch (_) {
        // Still offline or another error — leave unsynced for next pass.
      }
    }
  }

  /// Streams entries for the given month, newest first.
  Stream<List<KaamEntryModel>> watchEntriesForMonth(DateTime month) {
    final uid = _uid;
    if (uid == null) return const Stream.empty();

    final start = DateTime(month.year, month.month, 1);
    final end = DateTime(month.year, month.month + 1, 1);

    return _collection(uid)
        .where('date', isGreaterThanOrEqualTo: Timestamp.fromDate(start))
        .where('date', isLessThan: Timestamp.fromDate(end))
        .orderBy('date', descending: true)
        .snapshots()
        .map(
          (snap) =>
              snap.docs.map((d) => KaamEntryModel.fromMap(d.data())).toList(),
        );
  }

  /// Reads every entry currently cached locally (all months), newest
  /// first. Used as an instant-first-paint fallback and for all-time
  /// calculations such as the income certificate's average.
  Future<List<KaamEntryModel>> readLocalEntries() async {
    final box = await _openBox();
    final entries = box.values
        .whereType<Map>()
        .map((m) => KaamEntryModel.fromJson(m))
        .toList();
    entries.sort((a, b) => b.date.compareTo(a.date));
    return entries;
  }
}
