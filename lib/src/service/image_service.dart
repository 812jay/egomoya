import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:egomoya/util/helper/immutable_helper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

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

  Future<void> cachedNetworkFile(List<String> urlList) async {
    if (urlList.isEmpty) return;
    for (var url in urlList) {
      final String imageName = url.split('/').last;
      final http.Response response = await http.get(Uri.parse(url));
      final Uint8List uint8list = response.bodyBytes;
      final ByteBuffer buffer = uint8list.buffer;
      final byteData = ByteData.view(buffer);
      final String tempDirPath = await _getTemporaryDirectoryPath();
      File file = await File('$tempDirPath/$imageName').writeAsBytes(
        buffer.asUint8List(
          byteData.offsetInBytes,
          byteData.lengthInBytes,
        ),
      );
      imageList = [...imageList, file].toImmutable();
    }
    notifyListeners();
  }

  Future<String> _getTemporaryDirectoryPath() async {
    Directory tempDir = await getTemporaryDirectory();
    return tempDir.path;
  }

  void onClearImageList() {
    imageList = [].toImmutable();
  }
}
