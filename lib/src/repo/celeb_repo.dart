import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egomoya/src/model/celeb/celeb.dart';
import 'package:egomoya/src/repo/base_repo.dart';
import 'package:egomoya/util/helper/immutable_helper.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

class CelebRepo extends BaseRepo {
  final CollectionReference celebCollection = firestore.collection('celeb');
  Future<List<Celeb>?> fetchCelebList() async {
    List<Celeb> result = [];
    try {
      QuerySnapshot snapshot = await celebCollection.get();
      for (var docSnapshot in snapshot.docs) {
        final data = docSnapshot.data() as Map<String, dynamic>;
        final Celeb celeb = Celeb.fromJson(data);
        result = [...result, celeb].toImmutable();
      }
    } catch (e, s) {
      log('error: $e, stackTrace: $s');
    }
    return result;
  }
}
