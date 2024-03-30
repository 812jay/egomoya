import 'package:egomoya/src/service/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastHelper {
  static void showToast(
    BuildContext context, {
    required String text,
  }) {
    Fluttertoast.showToast(
      msg: text,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 2,
      backgroundColor: context.color.primary,
      textColor: context.color.white,
    );
  }
}
