import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egomoya/src/model/comment/comment.dart';
import 'package:egomoya/src/model/user/user.dart';
import 'package:egomoya/src/repo/base_repo.dart';
import 'package:egomoya/util/request_result.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;
final fireStorage = FirebaseStorage.instance;

class CommentRepo extends BaseRepo {
  final CollectionReference commentCollection = firestore.collection('comment');
  final CollectionReference userCollection = firestore.collection('user');

  Future<RequestResult<List<CommentRes>>> fetchCommentList(String questionId) =>
      handleRequest(() async {
        List<CommentRes> result = [];
        final querySnapshot = await firestore
            .collection('comment')
            .where('questionId', isEqualTo: questionId)
            .get();
        for (var doc in querySnapshot.docs) {
          String uid = doc['uid'] as String;
          DocumentSnapshot userDocSnapshot =
              await userCollection.doc(uid).get();
          final userData = userDocSnapshot.data() as Map<String, dynamic>;
          final UserRes user = UserRes.fromJson(userData);
          final data = doc.data();
          final CommentRes comment = CommentRes.fromJson(data);

          result = [...result, comment.copyWith(user: user)];
          result.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        }
        return result;
      });

  Future<RequestResult<void>> registComment({
    required String questionId,
    String? parentId,
    String? commentId,
    required String content,
    required String uid,
  }) =>
      handleRequest(() async {
        final req = CommentReq(
          questionId: questionId,
          commentId: commentId ??= const Uuid().v4(),
          uid: uid,
          content: content,
          parentId: parentId,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
        await firestore.collection('comment').doc(commentId).set(req.toJson());
      });

  Future<RequestResult<void>> updateComment({
    required String commentId,
    required String content,
  }) =>
      handleRequest(() async {
        await firestore.collection('comment').doc(commentId).update({
          'content': content,
          'updatedAt': Timestamp.now(),
        });
      });

  Future<RequestResult<void>> deleteComment(String commentId) =>
      handleRequest(() async {
        await firestore.collection('comment').doc(commentId).delete();
      });
}
