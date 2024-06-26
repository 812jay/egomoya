import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egomoya/src/model/user/user.dart';
import 'package:egomoya/src/repo/base_repo.dart';
import 'package:egomoya/util/request_result.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

final FirebaseAuth fireAuth = FirebaseAuth.instance;

class UserRepo extends BaseRepo {
  final CollectionReference userCollection = firestore.collection('user');
  Future<RequestResult<UserRes?>> fetchUser(String uid) =>
      handleRequest(() async {
        DocumentSnapshot docSnapshot = await userCollection.doc(uid).get();
        final data = docSnapshot.data() as Map<String, dynamic>?;
        UserRes? result;
        if (data != null) {
          result = UserRes.fromJson(data);
        }
        return result;
      });

  Future<RequestResult<String?>> registUser(UserReq req) =>
      handleRequest(() async {
        final ref = firestore.collection('user').doc(req.uid);
        ref.set(req.toJson());
        return req.uid;
      });

  Future<RequestResult<UserCredential?>> signInWithGoogle() =>
      handleRequest(() async {
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
        final GoogleSignInAuthentication? googleAuth =
            await googleUser?.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        final userCredential = await fireAuth.signInWithCredential(credential);
        return userCredential;
      });

  Future<RequestResult<UserCredential?>> signInWithApple() =>
      handleRequest(() async {
        final AuthorizationCredentialAppleID appleCredential =
            await SignInWithApple.getAppleIDCredential(
          scopes: [
            AppleIDAuthorizationScopes.email,
            AppleIDAuthorizationScopes.fullName,
          ],
        );

        final OAuthCredential credential =
            OAuthProvider('apple.com').credential(
          idToken: appleCredential.identityToken,
          accessToken: appleCredential.authorizationCode,
        );
        final UserCredential userCredential =
            await fireAuth.signInWithCredential(credential);

        return userCredential;
      });

  Future<RequestResult<void>> signOut() => handleRequest(() async {
        await fireAuth.signOut();
      });
}
