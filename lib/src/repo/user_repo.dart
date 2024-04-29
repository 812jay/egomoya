import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egomoya/src/repo/base_repo.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

final auth.FirebaseAuth fireAuth = auth.FirebaseAuth.instance;

class UserRepo extends BaseRepo {
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

  Future<void> signOut() async {
    try {
      await fireAuth.signOut();
    } catch (e, s) {
      log('error: $e, stackTrace: $s');
    }
  }
}
