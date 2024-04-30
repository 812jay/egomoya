import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egomoya/src/repo/base_repo.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

final auth.FirebaseAuth fireAuth = auth.FirebaseAuth.instance;

class UserRepo extends BaseRepo {
  Future<User?> fetchUser() async {
    return null;

    // final result = fireAuth.currentUser;
    // return result;
  }

  Future<bool> fetchUserValidate(String uid) async {
    try {
      final snapshot = await firestore.collection('user').doc(uid).get();
      final data = snapshot.data();
      final hasUserId = data != null && data.isNotEmpty;
      return hasUserId;
    } catch (e, s) {
      log('error: $e, stackTrace: $s');
    }
    return false;
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = auth.GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final userCredential = await fireAuth.signInWithCredential(credential);
      return userCredential;
    } catch (e, s) {
      log('error: $e, stackTrace: $s');
    }
    return null;
  }

  Future<UserCredential?> signInWithApple() async {
    try {
      final AuthorizationCredentialAppleID appleCredential =
          await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      final OAuthCredential credential = OAuthProvider('apple.com').credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );
      final UserCredential userCredential =
          await fireAuth.signInWithCredential(credential);

      return userCredential;
    } catch (e, s) {
      log('error: $e, stackTrace: $s');
    }
    return null;
  }

  Future<void> signOut() async {
    try {
      await fireAuth.signOut();
    } catch (e, s) {
      log('error: $e, stackTrace: $s');
    }
  }
}
