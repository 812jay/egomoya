import 'dart:developer';

import 'package:egomoya/src/repo/base_repo.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
