import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egomoya/src/model/user/user.dart';
import 'package:egomoya/src/repo/base_repo.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

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

  Future<void> registUser({
    required User user,
  }) async {
    final CollectionReference userCollection = firestore.collection('user');
    try {
      userCollection.doc(user.id).set({});
    } catch (e, s) {
      log('error: $e, stackTrace: $s');
    }
  }
}
