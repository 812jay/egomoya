import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egomoya/src/model/question/question.dart';
import 'package:egomoya/src/repo/base_repo.dart';
import 'package:egomoya/util/request_result.dart';
import 'package:firebase_storage/firebase_storage.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

final fireStorage = FirebaseStorage.instance;

class QuestionRepo extends BaseRepo {
  final CollectionReference questionCollection =
      firestore.collection('question');
  final CollectionReference commentCollection = firestore.collection('comment');

  Future<RequestResult<List<QuestionRes>>> fetchQuestionList({
    required int limit,
    required int? offset,
  }) =>
      handleRequest(() async {
        List<QuestionRes> result = [];
        final snapshot = await questionCollection
            .orderBy('questionId')
            .startAfter([offset])
            .limit(limit)
            .get();
        for (var doc in snapshot.docs) {
          final data = doc.data() as Map<String, dynamic>;
          final QuestionRes question = QuestionRes.fromJson(data);
          List<String> imgPathList = [];
          for (var imgName in question.imgNameList) {
            String imgPath = await fireStorage
                .ref('images/question/${question.questionId}/$imgName')
                .getDownloadURL();
            imgPathList = [...imgPathList, imgPath];
          }
          final int? commentCnt = await commentCollection
              .where('questionId', isEqualTo: question.questionId)
              .count()
              .get()
              .then((value) => value.count);
          result = [
            ...result,
            question.copyWith(
              imgPathList: imgPathList,
              commentCnt: commentCnt,
            )
          ];
          result.sort(
            (a, b) => b.createdAt.compareTo(a.createdAt),
          );
        }
        return result;
      });

  Future<RequestResult<QuestionRes?>> fetchQuestionDetail(String questionId) =>
      handleRequest(() async {
        DocumentSnapshot<QuestionRes> docSnapshot = await questionCollection
            .doc(questionId)
            .withConverter(
              fromFirestore: (snapshot, _) =>
                  QuestionRes.fromJson(snapshot.data()!),
              toFirestore: (model, _) => model.toJson(),
            )
            .get();

        QuestionRes? result = docSnapshot.data();
        List<String> imgPathList = [];
        if (result?.imgNameList != null) {
          for (var imgName in result!.imgNameList) {
            String imgPath = await fireStorage
                .ref('images/question/${result.questionId}/$imgName')
                .getDownloadURL();
            imgPathList = [...imgPathList, imgPath];
          }
        }

        return result?.copyWith(
          imgPathList: imgPathList,
        );
      });

  Future<RequestResult<void>> registQuestion({
    required QuestionReq req,
    required List<File> imgList,
  }) =>
      handleRequest(() async {
        List<String> imgNameList = [];
        for (var img in imgList) {
          String imgName = '${req.questionId}_${img.hashCode}';
          String imgRef = '/images/question/${req.questionId}/$imgName';
          imgNameList = [...imgNameList, imgName];
          await fireStorage.ref(imgRef).putFile(img);
        }
        final ref = questionCollection.doc(req.questionId);
        ref.set(req.copyWith(imgNameList: imgNameList).toJson());
      });

  Future<RequestResult<void>> updateQuestion({
    required String questionId,
    String? title,
    String? content,
    required List<File> imgList,
  }) =>
      handleRequest(() async {
        List<String> imgNameList = [];
        for (var img in imgList) {
          String imgName = '${questionId}_${img.hashCode}';
          String imgRef = '/images/question/$questionId/$imgName';
          imgNameList = [...imgNameList, imgName];
          await fireStorage.ref(imgRef).putFile(img);
        }
        final ref = questionCollection.doc(questionId);
        ref.update({
          'title': title ?? '',
          'content': content ?? '',
          'imgNameList': imgNameList,
          'updatedAt': Timestamp.now(),
        });
      });

  Future<RequestResult<void>> deleteQuestion(String questionId) =>
      handleRequest(() async {
        await firestore.collection('question').doc(questionId).delete();
      });

  Future<RequestResult<void>> updateQuestionViewCnt({
    required String questionId,
  }) =>
      handleRequest(() async {
        var docSnapshot =
            await firestore.collection('question').doc(questionId).get();
        var viewCnt = docSnapshot.data()?['viewCnt'] ?? 0;
        await firestore
            .collection('question')
            .doc(questionId)
            .update({'viewCnt': viewCnt + 1});
      });
}
