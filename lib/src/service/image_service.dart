import 'package:egomoya/util/helper/immutable_helper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class ImageService with ChangeNotifier {
  List<XFile> imageList = [];

  Future<void> select({
    int? limit,
  }) async {
    limit = limit ?? 5;
    final ImagePicker picker = ImagePicker();
    final newImages = await picker.pickMultiImage();
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

  void delete(XFile file) {
    imageList = imageList.where((image) => image != file).toImmutable();
    notifyListeners();
  }
}
