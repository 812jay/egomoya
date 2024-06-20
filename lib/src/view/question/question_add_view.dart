import 'dart:io';

import 'package:egomoya/src/repo/question_repo.dart';
import 'package:egomoya/src/service/theme_service.dart';
import 'package:egomoya/src/service/user_service.dart';
import 'package:egomoya/src/view/base_view.dart';
import 'package:egomoya/src/view/question/question_add_view_model.dart';
import 'package:egomoya/theme/component/app_bar/base_app_bar.dart';
import 'package:egomoya/theme/component/box/image_box.dart';
import 'package:egomoya/theme/component/button/button.dart';
import 'package:egomoya/theme/foundation/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class QuestionAddView extends StatelessWidget {
  const QuestionAddView({
    super.key,
    required this.args,
  });
  final QuestionAddViewArgument args;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: QuestionAddViewModel(
        args: args,
        questionRepo: context.read<QuestionRepo>(),
        userService: context.read<UserService>(),
      ),
      builder: (context, viewModel) {
        return GestureDetector(
          onTap: FocusScope.of(context).unfocus,
          child: Scaffold(
            appBar: const BaseAppBar(title: '질문 등록'),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _InputPicture(
                      imageList: viewModel.imageList,
                      onSelectImage: viewModel.onSelectImage,
                      onDeleteImage: viewModel.onDeleteImage,
                    ),
                    const SizedBox(height: 20),
                    _InputTitle(
                      controller: viewModel.titleController,
                      onChangeTitle: viewModel.onChangeTitle,
                      onClearTitle: viewModel.onClearTitle,
                    ),
                    const SizedBox(height: 20),
                    _InputContent(
                      controller: viewModel.contentController,
                      onChangeContent: viewModel.onChangeContent,
                    ),
                    const SizedBox(height: 20),
                    _SubmitButton(
                      onSubmit: viewModel.onSubmit,
                      isActive: viewModel.isActive,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _InputPicture extends StatelessWidget {
  const _InputPicture({
    super.key,
    required this.imageList,
    required this.onSelectImage,
    required this.onDeleteImage,
  });
  final List<File> imageList;
  final GestureTapCallback onSelectImage;
  final Function(int) onDeleteImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '사진',
          style: context.typo.body2.bold,
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 130,
          child: ListView.builder(
            itemCount: imageList.length + 1,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  index == 0
                      ? ImageAddBox(
                          onTap: onSelectImage,
                          padding: const EdgeInsets.only(right: 10),
                          height: 120,
                          width: 120,
                          limitCnt: 5,
                          curCnt: imageList.length,
                        )
                      : ImageBox(
                          imgPath: imageList[index - 1].path,
                          onDelete: () => onDeleteImage(index - 1),
                          height: 120,
                          width: 120,
                        ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class _InputTitle extends StatelessWidget {
  const _InputTitle({
    super.key,
    required this.controller,
    required this.onChangeTitle,
    this.titleErrMsg,
    required this.onClearTitle,
  });
  final TextEditingController controller;
  final Function(String) onChangeTitle;
  final String? titleErrMsg;
  final GestureTapCallback onClearTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '제목',
                style: context.typo.body2.bold,
              ),
              TextSpan(
                text: '*',
                style: context.typo.body2.bold.pointColor,
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: controller,
          keyboardType: TextInputType.text,
          onChanged: (text) => onChangeTitle(text),
          inputFormatters: [
            LengthLimitingTextInputFormatter(40),
          ],
          decoration: InputDecoration(
            hintText: '제목을 입력해 주세요',
            errorText: titleErrMsg,
            counterText: '${controller.text.length}/40',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                width: 1,
              ),
            ),
            suffixIcon: controller.text.isEmpty
                ? null
                : CloseButton(
                    onPressed: onClearTitle,
                  ),
          ),
        ),
      ],
    );
  }
}

class _InputContent extends StatelessWidget {
  const _InputContent({
    super.key,
    required this.controller,
    required this.onChangeContent,
  });
  final TextEditingController controller;
  final Function(String) onChangeContent;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '내용',
          style: context.typo.body2.bold,
        ),
        const SizedBox(height: 10),
        TextField(
          controller: controller,
          keyboardType: TextInputType.multiline,
          maxLength: 500,
          maxLines: 10,
          onChanged: (text) => onChangeContent(text),
          inputFormatters: [
            LengthLimitingTextInputFormatter(500),
          ],
          decoration: InputDecoration(
            hintText: '내용을 입력해 주세요',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                width: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({
    super.key,
    required this.onSubmit,
    required this.isActive,
  });
  final Function(BuildContext) onSubmit;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Button.text(
      context,
      onTap: () => isActive ? onSubmit(context) : null,
      isActive: isActive,
      text: '등록하기',
    );
  }
}
