import 'dart:io';

import 'package:dio/dio.dart';
import 'package:egomoya/util/helper/immutable_helper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class ImageService with ChangeNotifier {
  List<File> imageList = [];

  Future<void> select({
    int? limit,
  }) async {
    limit = limit ?? 5;
    final ImagePicker picker = ImagePicker();
    final List<XFile> xFiles = await picker.pickMultiImage();
    final List<File> newImages = xFiles.map((e) => File(e.path)).toList();
    if (imageList.length + newImages.length > limit) {
      Fluttertoast.showToast(
        msg: '이미지는 $limit개까지 등록할 수 있어요',
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 2,
      );
      return;
    }
    imageList = [...imageList, ...newImages].toImmutable();
    notifyListeners();
  }

  void delete(File file) {
    imageList = imageList.where((image) => image != file).toImmutable();
    notifyListeners();
  }

  Future<FormData> xFileListToFormData({
    required List<File> fileList,
    required String userId,
  }) async {
    final List<MultipartFile> multipartFileList = fileList
        .map((file) => MultipartFile.fromFileSync(
              file.path,
              filename: '${userId}_${file.hashCode}',
            ))
        .toList();

    final formDataMap = {'files': multipartFileList};
    final result = FormData.fromMap(formDataMap);
    return result;
  }

  void onClearImageList() {
    imageList = [].toImmutable();
  }
}
