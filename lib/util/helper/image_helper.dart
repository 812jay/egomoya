import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:egomoya/util/helper/immutable_helper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class ImageHelper {
  static Future<File?> selectImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? xFile = await picker.pickImage(source: ImageSource.gallery);
    final File? file = xFile != null ? File(xFile.path) : null;
    return file;
  }

  static Future<List<File>> selectImageList({
    required List<File> imageFileList,
    int? limit,
  }) async {
    limit = limit ?? 5;
    final ImagePicker picker = ImagePicker();
    final List<XFile> xFiles = await picker.pickMultiImage();
    final List<File> newImageList = xFiles.map((e) => File(e.path)).toList();
    if (imageFileList.length + newImageList.length > limit) {
      Fluttertoast.showToast(
        msg: '이미지는 $limit개까지 등록할 수 있어요',
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 2,
      );
      return imageFileList;
    }
    imageFileList = [...imageFileList, ...newImageList].toImmutable();
    return imageFileList;
  }

  static List<File> deleteFromList({
    required List<File> imageFileList,
    required File img,
  }) {
    final List<File> result =
        imageFileList.where((image) => image != img).toImmutable();
    return result;
  }

  static Future<List<File>> urlListToFileList(List<String> urlList) async {
    List<File> imageList = [];
    for (var url in urlList) {
      File file = await urlToFile(url);
      imageList = [...imageList, file].toImmutable();
    }
    return imageList;
  }

  static Future<File> urlToFile(String url) async {
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
    return file;
  }

  static Future<String> _getTemporaryDirectoryPath() async {
    Directory tempDir = await getTemporaryDirectory();
    return tempDir.path;
  }

  static Future<FormData?> xFileListToFormData({
    required List<File> fileList,
    required String userId,
  }) async {
    if (fileList.isEmpty) return null;
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

  static String getFileName(String filePath) {
    return filePath.split('/').last;
  }
}
