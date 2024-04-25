import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egomoya/src/repo/base_repo.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

class CelebRepo extends BaseRepo {
  final CollectionReference celebCollection = firestore.collection('celeb');
  Future<void> fetchCelebList() async {
    try {
      QuerySnapshot snapshot = await celebCollection.get();
      for (var celeb in snapshot.docs) {
        log('celeb: ${celeb.data()}');
      }
    } catch (e) {
      log('error: $e');
    }
  }
}
