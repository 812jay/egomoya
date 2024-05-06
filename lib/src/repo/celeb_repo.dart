import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egomoya/src/model/celeb/celeb.dart';
import 'package:egomoya/src/repo/base_repo.dart';
import 'package:egomoya/util/request_result.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

class CelebRepo extends BaseRepo {
  final CollectionReference celebCollection = firestore.collection('celeb');
  Future<RequestResult<List<Celeb>?>> fetchCelebList() =>
      handleRequest(() async {
        List<Celeb> result = [];
        QuerySnapshot snapshot = await celebCollection.get();
        for (var docSnapshot in snapshot.docs) {
          final data = docSnapshot.data() as Map<String, dynamic>;
          final Celeb celeb = Celeb.fromJson(data);
          result = [...result, celeb];
        }
        return result;
      });
}
