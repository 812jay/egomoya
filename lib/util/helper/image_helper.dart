import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:egomoya/util/helper/immutable_helper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

final ImagePicker picker = ImagePicker();

class ImageHelper {
  static Future<File?> selectImage() async {
    final XFile? xFile = await picker.pickImage(source: ImageSource.gallery);
    if (xFile == null) return null;
    final File file = File(xFile.path);
    return file;
  }

  static Future<File?> selectCamera() async {
    final XFile? xFile = await picker.pickImage(source: ImageSource.camera);
    final File? file = xFile != null ? File(xFile.path) : null;
    return file;
  }

  static Future<List<File>> selectImageList({
    required List<File> imageFileList,
    int? limit,
  }) async {
    limit = limit ?? 5;
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

  // static Future<List<File>> urlListToFileList(List<String> urlList) async {
  //   List<File> imageList = [];
  //   for (var url in urlList) {
  //     File file = await urlToFile(url);
  //     imageList = [...imageList, file].toImmutable();
  //   }
  //   return imageList;
  // }

  static Future<File> urlToFile({
    required String url,
    required String fileName,
  }) async {
    final http.Response response = await http.get(Uri.parse(url));
    final Uint8List uint8list = response.bodyBytes;
    final ByteBuffer buffer = uint8list.buffer;
    final byteData = ByteData.view(buffer);
    final String tempDirPath = await _getTemporaryDirectoryPath();
    File file = await File('$tempDirPath/$fileName').writeAsBytes(
      buffer.asUint8List(
        byteData.offsetInBytes,
        byteData.lengthInBytes,
      ),
    );
    return file;
  }

  static Future<List<File>> urlListToFileList({
    required List<String> urlList,
  }) async {
    List<File> fileList = [];
    for (var url in urlList) {
      String fileName = url.split('%2F').last.split('?').first;
      final File file = await urlToFile(url: url, fileName: fileName);
      fileList = [...fileList, file];
    }
    return fileList;
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

  static Future<FormData> fileToFormData(File file) async {
    final MultipartFile multipartFile = MultipartFile.fromFileSync(file.path);
    final formData = {'files': multipartFile};
    final result = FormData.fromMap(formData);
    return result;
  }

  static String getFileName(String filePath) {
    return filePath.split('/').last;
  }
}
