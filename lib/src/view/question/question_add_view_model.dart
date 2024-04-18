import 'dart:io';

import 'package:dio/dio.dart';
import 'package:egomoya/src/data/dto/image/img.dart';
import 'package:egomoya/src/data/dto/post/post.dart';
import 'package:egomoya/src/data/enum/validator_type.dart';
import 'package:egomoya/src/model/post_model.dart';
import 'package:egomoya/src/service/post_service.dart';
import 'package:egomoya/src/view/base_view_model.dart';
import 'package:egomoya/theme/component/dialog/base_dialog.dart';
import 'package:egomoya/util/helper/image_helper.dart';
import 'package:flutter/material.dart';

class QuestionAddViewModel extends BaseViewModel {
  QuestionAddViewModel(
    this._postService,
    this._postModel,
    this._postData,
  ) {
    _postService.addListener(notifyListeners);
    titleController = TextEditingController(text: _postData?.title ?? '');
    contentController = TextEditingController(text: _postData?.content ?? '');
    setInitImageList();
  }

  final PostService _postService;
  final PostModel _postModel;
  final PostData? _postData;
  late TextEditingController titleController;
  late TextEditingController contentController;

  String get appbarTitle => _postData != null ? '질문 수정' : '질문 등록';

  List<Img> serverImageList = [];
  List<File> localImageFileList = [];

  List<String> get _serverUploadNameList =>
      serverImageList.map((e) => e.uploadName).toList();
  List<String> get _localImageFilePathList =>
      localImageFileList.map((e) => e.path).toList();

  List<String> _addFilePathList = [];
  List<String> _deleteUploadNameList = [];

  // 초기 진입시 errMsg 안띄우기 위한 초기값
  bool isChangedTitle = false;

  String get _title => titleController.text;
  String get _content => contentController.text;
  bool get isValidateTitle =>
      RegExp(PostValidateType.title.pattern).hasMatch(_title);
  bool get isActiveSubmitButton => isValidateTitle && !isBusy;

  // 에러 메시지
  String? get titleErrMsg =>
      (isValidateTitle || !isChangedTitle) ? null : '1자 이상, 40자 이하 입력해주세요';

  @override
  void dispose() {
    _postService.removeListener(notifyListeners);
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  void setInitImageList() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      isBusy = true;
      serverImageList = _postData?.imageList ?? [];
      localImageFileList = await ImageHelper.urlListToFileList(
          _postData?.imageList?.map((e) => e.imageUrl).toList() ?? []);
      isBusy = false;
    });
  }

  void onTapLeading(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return BaseDialog(
          content: '뒤로가기하면 등록하던 글을 다시 작성해야해요. 그래도 나가시겠어요?',
          cancelText: '나가기',
          confirmText: '계속 작성하기',
          onTapCancel: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
        );
      },
    );
  }

  void onChangeTitle(String newTitle) {
    isChangedTitle = true;
    notifyListeners();
  }

  void onChangeContent(String newContent) => notifyListeners();

  void onClearTitle() {
    notifyListeners();
    titleController.clear();
  }

  void onSelectImage() async {
    isBusy = true;
    localImageFileList = await ImageHelper.selectList(
      imageFileList: localImageFileList,
      limit: 5,
    );
    await Future.delayed(const Duration(seconds: 1));
    onChangeUploadNameList();
    isBusy = false;
  }

  void onDeleteImage(int index) {
    isBusy = true;
    localImageFileList = ImageHelper.deleteFromList(
      imageFileList: localImageFileList,
      img: localImageFileList.elementAt(index),
    );
    onChangeUploadNameList();
    isBusy = false;
  }

  void onChangeUploadNameList() {
    _addFilePathList = _localImageFilePathList
        .where((e) => !_serverUploadNameList.contains(e))
        .toList();
    _deleteUploadNameList = _serverUploadNameList
        .where((e) => !_localImageFilePathList.contains(e))
        .toList();
  }

  void onSubmit(BuildContext context) async {
    isBusy = true;
    final FormData? formData = await ImageHelper.xFileListToFormData(
      fileList: _addFilePathList.map((e) => File(e)).toList(),
      userId: _postModel.userId,
    );
    final result = await _postModel.registPost(
      title: _title,
      content: _content,
      postId: _postData?.postId,
      uploadFormData: formData,
      deleteUploadNameList: _deleteUploadNameList,
    );
    result.onFailure((e) {
      showToast('요고 궁금 게시글을 등록하는데 실패했어요');
    }).onSuccess((value) async {
      showToast('요고 궁금 게시글을 등록했어요');
      Navigator.pop(context);
      if (_postData != null) {
        await _postService.refreshPostDetail(_postData.postId);
      }
    });

    isBusy = false;
  }

  Future<File> urlToFile(String url) async {
    final result = await ImageHelper.urlToFile(url);
    return result;
  }
}
