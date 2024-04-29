import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egomoya/src/repo/base_repo.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

final auth.FirebaseAuth fireAuth = auth.FirebaseAuth.instance;

class UserRepo extends BaseRepo {
  Future<GoogleSignInAccount?> signInWithGoogle() async {
    try {
      GoogleSignIn signIn = GoogleSignIn();
      GoogleSignInAccount? account = await signIn.signIn();
      return account;
    } catch (e, s) {
      log('error: $e, stackTrace: $s');
    }
    return null;
  }
}
