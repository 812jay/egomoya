import 'dart:io';

import 'package:dio/dio.dart';
import 'package:egomoya/src/data/enum/validator_type.dart';
import 'package:egomoya/src/model/post_model.dart';
import 'package:egomoya/src/service/image_service.dart';
import 'package:egomoya/src/service/post_service.dart';
import 'package:egomoya/src/view/base_view_model.dart';
import 'package:egomoya/theme/component/dialog/base_dialog.dart';
import 'package:flutter/material.dart';

class QuestionAddViewModel extends BaseViewModel {
  QuestionAddViewModel(
    this.imageService,
    this.postService,
    this._postModel,
  ) {
    imageService.addListener(notifyListeners);
    postService.addListener(notifyListeners);
  }
  final ImageService imageService;
  final PostService postService;
  final PostModel _postModel;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  List<File> get imageList => imageService.imageList;

  // 초기 진입시 errMsg 안띄우기 위한 초기값
  bool isChangedTitle = false;

  String get title => titleController.text;
  String get content => contentController.text;
  bool get isValidateTitle =>
      RegExp(PostValidateType.title.pattern).hasMatch(title);
  bool get isActiveSubmitButton => isValidateTitle;

  // 에러 메시지
  String? get titleErrMsg =>
      (isValidateTitle || !isChangedTitle) ? null : '1자 이상, 40자 이하 입력해주세요';

  @override
  void dispose() {
    imageService.removeListener(notifyListeners);
    postService.removeListener(notifyListeners);
    titleController.dispose();
    contentController.dispose();
    super.dispose();
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
            imageService.onClearImageList();
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

  void selectImage() => imageService.select(limit: 5);

  void onDeleteImage(int index) =>
      imageService.delete(imageList.elementAt(index));

  void onSubmit(BuildContext context) async {
    final fileList = imageService.imageList;

    final FormData formData = await imageService.xFileListToFormData(
      fileList: fileList,
      userId: _postModel.userId,
    );

    final result = await _postModel.registPost(
      title: title,
      content: content,
      password: '1111',
      nickname: 'nickname',
      imgFormData: formData,
    );
    result.onFailure((e) {
      showToast('요고 궁금 게시글을 등록하는데 실패했어요');
    }).onSuccess((value) async {
      showToast('요고 궁금 게시글을 등록했어요');
      Navigator.pop(context);
    });
  }

  Future<void> fetchPost() async {
    final result = await postService.fetchPost();
    result
      ..onFailure((e) => showToast('요고 궁금 데이터들을 불러오는데 실패했어요'))
      ..onSuccess((newPost) async {
        postService.setPost(newPost);
      });
  }
}
