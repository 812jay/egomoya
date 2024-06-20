import 'package:egomoya/src/view/base_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpViewArgument {
  SignUpViewArgument({
    this.credential,
  });
  final UserCredential? credential;
}

class SignUpViewModel extends BaseViewModel {
  SignUpViewModel({this.args}) {
    setInitArgs();
  }
  final SignUpViewArgument? args;
  UserCredential? credential;
  setInitArgs() {
    credential = args?.credential;
  }
}
