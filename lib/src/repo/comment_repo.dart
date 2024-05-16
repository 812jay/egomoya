import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egomoya/src/model/comment/comment.dart';
import 'package:egomoya/src/repo/base_repo.dart';
import 'package:egomoya/util/request_result.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;
final fireStorage = FirebaseStorage.instance;

class CommentRepo extends BaseRepo {
  final CollectionReference celebCollection = firestore.collection('comment');

  Future<RequestResult<void>> registComment({
    required String questionId,
    String? parentId,
    String? commentId,
    required String content,
    required String uid,
  }) =>
      handleRequest(() async {
        final req = CommentReq(
          commentId: commentId ??= const Uuid().v4(),
          uid: uid,
          content: content,
          parentId: parentId,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
        await firestore.collection('comment').doc(commentId).set(req.toJson());
      });
}
