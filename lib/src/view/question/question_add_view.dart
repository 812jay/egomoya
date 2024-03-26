import 'package:egomoya/src/service/theme_service.dart';
import 'package:egomoya/src/view/base_view.dart';
import 'package:egomoya/src/view/question/question_add_view_model.dart';
import 'package:egomoya/src/view/question/widget/image_box.dart';
import 'package:egomoya/theme/component/app_bar/app_bar_close_btn.dart';
import 'package:egomoya/theme/component/button/button.dart';
import 'package:egomoya/theme/component/icon/asset_icon_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class QuestionAddView extends StatelessWidget {
  const QuestionAddView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: QuestionAddViewModel(),
      builder: (context, viewModel) {
        return Scaffold(
          appBar: const BaseAppBar(
            isLeadingCloseIcon: true,
            title: '질문 등록',
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _InputPicture(),
                  const SizedBox(height: 15),
                  _InputTitle(
                    controller: viewModel.titleController,
                    onChanged: viewModel.onChangeTitle,
                    onClear: viewModel.onClearTitle,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    '내용',
                    style: context.typo.textFormTitle,
                  ),
                  const SizedBox(height: 12),
                  _InputContent(
                    controller: viewModel.contentController,
                    onChanged: viewModel.onChangeContent,
                  ),
                  const SizedBox(height: 15),
                  _InputPassword(
                    controller: viewModel.passwordController,
                    onChanged: viewModel.onChangePassword,
                    onClear: viewModel.onClearPassword,
                  ),
                  const SizedBox(height: 23),
                  const _SubmitButton(),
                  const SizedBox(height: 33),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _InputPicture extends StatelessWidget {
  const _InputPicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '사진',
          style: context.typo.textFormTitle,
        ),
        const SizedBox(height: 12),
        Consumer<QuestionAddViewModel>(
          builder: (context, value, child) {
            return SizedBox(
              height: 130,
              child: ListView.builder(
                itemCount: value.images.length + 1,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      index == 0
                          ? ImageAddContainer(
                              onTap: value.selectImage,
                              padding: const EdgeInsets.only(right: 10),
                              height: 122,
                              width: 133,
                              limitCnt: 5,
                              curCnt: value.images.length,
                            )
                          : ImageBox(
                              imgPath: value.images[index - 1].path,
                              onDelete: () => value.onDeleteImage(index - 1),
                              height: 122,
                              width: 133,
                            ),
                    ],
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}

class _InputTitle extends StatelessWidget {
  const _InputTitle({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.onClear,
  });
  final TextEditingController controller;
  final void Function(String) onChanged;
  final GestureTapCallback onClear;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '제목',
          style: context.typo.textFormTitle,
        ),
        const SizedBox(height: 12),
        TextField(
          controller: controller,
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) => onChanged(value),
          decoration: InputDecoration(
            hintText: '제목을 입력해 주세요',
            // errorText: '',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
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
                    onPressed: onClear,
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
    required this.onChanged,
  });
  final TextEditingController controller;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Consumer<QuestionAddViewModel>(
      builder: (context, value, child) {
        return Column(
          children: [
            TextField(
              controller: controller,
              maxLines: 10,
              onChanged: (value) => onChanged(value),
              inputFormatters: [
                LengthLimitingTextInputFormatter(500),
              ],
              decoration: InputDecoration(
                hintText: '내용을 입력해 주세요',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    width: 1,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                '${value.content.length}/500',
                style: context.typo.textFormTitle,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _InputPassword extends StatelessWidget {
  const _InputPassword({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.onClear,
  });
  final TextEditingController controller;
  final void Function(String) onChanged;
  final GestureTapCallback onClear;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '비밀번호',
          style: context.typo.textFormTitle,
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            vertical: 7,
            horizontal: 14,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: context.color.boxDescription,
          ),
          child: Text(
            '비밀번호가 있어야 내가 작성한 글을 수정/삭제할 수 있어요! 꼭 기억해 주세요!',
            style: context.typo.descriptionSmall,
          ),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: controller,
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          onChanged: (value) => onChanged(value),
          inputFormatters: [
            LengthLimitingTextInputFormatter(8),
          ],
          decoration: InputDecoration(
            hintText: '숫자4자리~8자리로 구성해주세요',
            // errorText: '',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
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
                    onPressed: onClear,
                  ),
          ),
        ),
      ],
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Button(
      onPressed: () {},
      isInactive: true,
      width: double.infinity,
      text: '질문 등록',
      size: ButtonSize.large,
    );
  }
}
