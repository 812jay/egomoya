import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egomoya/src/model/question/question.dart';
import 'package:egomoya/src/model/user/user.dart';
import 'package:egomoya/src/repo/question_repo.dart';
import 'package:egomoya/src/service/user_service.dart';
import 'package:egomoya/src/view/base_view_model.dart';
import 'package:egomoya/util/helper/image_helper.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class QuestionAddViewArgument {
  QuestionAddViewArgument({
    required this.user,
  });
  final UserRes user;
}

const uuid = Uuid();

class QuestionAddViewModel extends BaseViewModel {
  QuestionAddViewModel({
    required this.args,
    required this.questionRepo,
    required this.userService,
  }) {
    setInit();
  }
  final QuestionAddViewArgument args;
  final QuestionRepo questionRepo;
  final UserService userService;

  final String questionId = uuid.v4();

  late TextEditingController titleController;
  late TextEditingController contentController;

  late UserRes user;

  List<File> imageList = [];

  bool get isActive =>
      titleController.text.isNotEmpty && contentController.text.isNotEmpty;

  setInit() {
    user = args.user;
    titleController = TextEditingController(text: '');
    contentController = TextEditingController(text: '');
  }

  Future<void> registQuestion() async {
    final result = await questionRepo.registQuestion(
      req: QuestionReq(
        questionId: questionId,
        title: '',
        content: '',
        uid: user.uid,
        createdAt: Timestamp.fromDate(DateTime.now()),
        updatedAt: Timestamp.fromDate(DateTime.now()),
      ),
      imgList: [],
    );
  }

  void onSelectImage() async {
    isBusy = true;
    imageList = await ImageHelper.selectImageList(
      imageFileList: imageList,
      limit: 5,
    );
    await Future.delayed(const Duration(seconds: 1));
    isBusy = false;
  }

  void onDeleteImage(int index) {
    isBusy = true;
    imageList = ImageHelper.deleteFromList(
      imageFileList: imageList,
      img: imageList.elementAt(index),
    );
    isBusy = false;
  }

  void onChangeTitle(String newTitle) {
    log('$isActive');
    notifyListeners();
  }

  void onClearTitle() {
    titleController.clear();
    notifyListeners();
  }

  void onChangeContent(String newContent) {
    notifyListeners();
  }

  Future<void> onSubmit(BuildContext context) async {
    final req = QuestionReq(
      questionId: questionId,
      title: titleController.text,
      content: contentController.text,
      uid: user.uid,
      createdAt: Timestamp.fromDate(DateTime.now()),
      updatedAt: Timestamp.fromDate(DateTime.now()),
    );
    questionRepo.registQuestion(
      req: req,
      imgList: imageList,
    );
  }
}
