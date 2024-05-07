import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egomoya/src/model/question/question.dart';
import 'package:egomoya/src/repo/base_repo.dart';
import 'package:egomoya/util/request_result.dart';
import 'package:firebase_storage/firebase_storage.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

final fireStorage = FirebaseStorage.instance;

class QuestionRepo extends BaseRepo {
  final CollectionReference celebCollection = firestore.collection('question');

  Future<RequestResult<List<QuestionRes>>> fetchQuestionList({
    required int limit,
    required int? offset,
  }) =>
      handleRequest(() async {
        List<QuestionRes> result = [];
        final snapshot = await celebCollection
            .orderBy('questionId')
            .startAfter([1])
            .limit(limit)
            .get();
        for (var doc in snapshot.docs) {
          final data = doc.data() as Map<String, dynamic>;
          final QuestionRes question = QuestionRes.fromJson(data);
          List<String> imgPathList = [];
          for (var imgName in question.imgNameList) {
            String imgPath = await fireStorage
                .ref('images/celeb/thumbnails/wendy.png')
                .getDownloadURL();
            imgPathList = [...imgPathList, imgPath];
          }
          result = [
            ...result,
            question.copyWith(
              imgPathList: imgPathList,
            )
          ];
        }
        return result;
      });
}
