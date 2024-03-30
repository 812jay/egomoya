import 'package:fluttertoast/fluttertoast.dart';

class ToastHelper {
  static void showToast(String text) {
    Fluttertoast.showToast(
      msg: text,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 2,
    );
  }
}
