import 'dart:io';

import 'package:egomoya/src/data/dto/post/post.dart';
import 'package:egomoya/src/model/post_model.dart';
import 'package:egomoya/src/service/post_service.dart';
import 'package:egomoya/src/service/theme_service.dart';
import 'package:egomoya/src/view/base_view.dart';
import 'package:egomoya/src/view/question/question_add_view_model.dart';
import 'package:egomoya/src/view/question/widget/image_box.dart';
import 'package:egomoya/theme/component/app_bar/base_app_bar.dart';
import 'package:egomoya/theme/component/button/button.dart';
import 'package:egomoya/theme/component/icon/asset_icon_type.dart';
import 'package:egomoya/util/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class QuestionAddView extends StatelessWidget {
  const QuestionAddView({
    super.key,
    this.postData,
  });
  final PostData? postData;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: QuestionAddViewModel(
        context.read<PostService>(),
        context.read<PostModel>(),
        postData,
      ),
      builder: (context, viewModel) {
        const SizedBox space = SizedBox(height: 36);
        return GestureDetector(
          onTap: FocusScope.of(context).unfocus,
          child: Scaffold(
            appBar: BaseAppBar(
              title: '질문 등록',
              onTapLeading: () => viewModel.onTapLeading(context),
            ),
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
                    space,
                    _InputTitle(
                      controller: viewModel.titleController,
                      onChangeTitle: viewModel.onChangeTitle,
                      titleErrMsg: viewModel.titleErrMsg,
                      onClearTitle: viewModel.onClearTitle,
                    ),
                    space,
                    _InputContent(
                      controller: viewModel.contentController,
                      onChangeContent: viewModel.onChangeContent,
                    ),
                    const SizedBox(height: 23),
                    _SubmitButton(
                      isActive: viewModel.isActiveSubmitButton,
                      onSubmit: viewModel.onSubmit,
                    ),
                    const SizedBox(height: 33),
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
                      ? ImageAddContainer(
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
                : Button(
                    iconPath: AssetIconType.close.path,
                    color: Colors.black,
                    type: ButtonType.flat,
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
    return Button(
      onPressed: () => isActive ? onSubmit(context) : null,
      isInactive: !isActive,
      width: double.infinity,
      text: '질문 등록',
      size: ButtonSize.large,
    );
  }
}
