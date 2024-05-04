import 'package:egomoya/theme/res/palette.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastHelper {
  static void showToast(
    String msg,
  ) async {
    await Fluttertoast.cancel();
    await Fluttertoast.showToast(
      msg: msg,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_LONG,
      timeInSecForIosWeb: 2,
      backgroundColor: Palette.red,
      textColor: Palette.white,
    );
  }
}
