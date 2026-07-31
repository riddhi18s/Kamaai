import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/job_model.dart';

class JobsRepository {
  JobsRepository({
    FirebaseFirestore? firestore,
  }) : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  static const String _collection = 'jobs';

  CollectionReference<Map<String, dynamic>> get _jobs =>
      _firestore.collection(_collection);

  Future<List<JobModel>> fetchJobs() async {
    final snapshot = await _jobs
        .orderBy('createdAt', descending: true)
        .get();

    return snapshot.docs
        .map(
          (doc) => JobModel.fromMap(
            doc.data(),
            doc.id,
          ),
        )
        .toList();
  }

  Future<JobModel?> getJob(String jobId) async {
    final doc = await _jobs.doc(jobId).get();

    if (!doc.exists) {
      return null;
    }

    return JobModel.fromMap(
      doc.data()!,
      doc.id,
    );
  }

  Future<void> postJob(JobModel job) async {
    await _jobs.doc(job.id).set(
          job.toMap(),
        );
  }

  Future<void> updateJob(JobModel job) async {
    await _jobs.doc(job.id).update(
          job.toMap(),
        );
  }

  Future<void> deleteJob(String jobId) async {
    await _jobs.doc(jobId).delete();
  }

  Stream<List<JobModel>> watchJobs() {
    return _jobs
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map(
                (doc) => JobModel.fromMap(
                  doc.data(),
                  doc.id,
                ),
              )
              .toList(),
        );
  }
}