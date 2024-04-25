// import 'package:egomoya/legacy/util/exeptions.dart';
// import 'package:egomoya/legacy/util/helper/toast_helper.dart';
// import 'package:flutter/material.dart';

// class BaseViewModel with ChangeNotifier {
//   bool _isBusy = false;

//   bool get isBusy => _isBusy;

//   set isBusy(bool isBusy) {
//     if (_isBusy == isBusy) return;
//     _isBusy = isBusy;
//     notifyListeners();
//   }

//   handleApiError(
//     CustomException e, {
//     String? toastMsg,
//   }) async {
//     if (!e.type.isHandled &&
//         toastMsg != null &&
//         CustomExceptionUtil.isShowToastFromDioError(e)) {
//       showToast(toastMsg);
//     }

//     CustomExceptionUtil.logging(e);
//   }

//   showToast(String msg, {double? fontSize, int seconds = 3}) {
//     ToastHelper.showToast(msg);
//   }
// }
