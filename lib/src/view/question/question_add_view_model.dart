import 'dart:io';

import 'package:dio/dio.dart';
import 'package:egomoya/src/data/dto/post/post.dart';
import 'package:egomoya/src/data/enum/validator_type.dart';
import 'package:egomoya/src/model/post_model.dart';
import 'package:egomoya/src/service/image_service.dart';
import 'package:egomoya/src/service/post_service.dart';
import 'package:egomoya/src/view/base_view_model.dart';
import 'package:egomoya/theme/component/dialog/base_dialog.dart';
import 'package:flutter/material.dart';

class QuestionAddViewModel extends BaseViewModel {
  QuestionAddViewModel(
    this._imageService,
    this._postService,
    this._postModel,
    this._postData,
  ) {
    _imageService.addListener(notifyListeners);
    _postService.addListener(notifyListeners);
    titleController = TextEditingController(text: _postData?.title ?? '');
    contentController = TextEditingController(text: _postData?.content ?? '');
    _imageService.cachedNetworkFile(
      _postData?.imageList?.map((e) => e.imageUrl).toList() ?? [],
    );
  }
  final ImageService _imageService;
  final PostService _postService;
  final PostModel _postModel;
  final PostData? _postData;
  late TextEditingController titleController;
  late TextEditingController contentController;

  List<File> get imageList => _imageService.imageList;

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
    _imageService.removeListener(notifyListeners);
    _postService.removeListener(notifyListeners);
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
            _imageService.onClearImageList();
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

  void selectImage() => _imageService.select(limit: 5);

  void onDeleteImage(int index) =>
      _imageService.delete(imageList.elementAt(index));

  void onSubmit(BuildContext context) async {
    final fileList = _imageService.imageList;

    final FormData formData = await _imageService.xFileListToFormData(
      fileList: fileList,
      userId: _postModel.userId,
    );

    final result = await _postModel.registPost(
      title: title,
      content: content,
      postId: _postData?.postId,
      password: '1111',
      nickname: 'nickname',
      imgFormData: formData,
    );
    result.onFailure((e) {
      showToast('요고 궁금 게시글을 등록하는데 실패했어요');
    }).onSuccess((value) async {
      showToast('요고 궁금 게시글을 등록했어요');
      Navigator.pop(context);
      await _postService.refreshPostList();
    });
  }
}
