import 'package:egomoya/src/model/post_model.dart';
import 'package:egomoya/src/service/image_service.dart';
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
  const QuestionAddView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: QuestionAddViewModel(
        context.read<ImageService>(),
        context.read<PostService>(),
        context.read<PostModel>(),
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
            body: const SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _InputPicture(),
                    space,
                    _InputTitle(),
                    space,
                    _InputContent(),
                    space,
                    _InputNickname(),
                    space,
                    _InputPassword(),
                    SizedBox(height: 23),
                    _SubmitButton(),
                    SizedBox(height: 33),
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
  const _InputPicture({super.key});

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
        Consumer<QuestionAddViewModel>(
          builder: (context, value, child) {
            return SizedBox(
              height: 130,
              child: ListView.builder(
                itemCount: value.imageList.length + 1,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      index == 0
                          ? ImageAddContainer(
                              onTap: value.selectImage,
                              padding: const EdgeInsets.only(right: 10),
                              height: 120,
                              width: 120,
                              limitCnt: 5,
                              curCnt: value.imageList.length,
                            )
                          : ImageBox(
                              imgPath: value.imageList[index - 1].path,
                              onDelete: () => value.onDeleteImage(index - 1),
                              height: 120,
                              width: 120,
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
  const _InputTitle({super.key});

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
        Consumer<QuestionAddViewModel>(
          builder: (context, value, child) {
            return TextField(
              controller: value.titleController,
              keyboardType: TextInputType.text,
              onChanged: (text) => value.onChangeTitle(text),
              inputFormatters: [
                LengthLimitingTextInputFormatter(40),
              ],
              decoration: InputDecoration(
                hintText: '제목을 입력해 주세요',
                errorText: value.titleErrMsg,
                counterText: '${value.title.length}/40',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    width: 1,
                  ),
                ),
                suffixIcon: value.titleController.text.isEmpty
                    ? null
                    : Button(
                        iconPath: AssetIconType.close.path,
                        color: Colors.black,
                        type: ButtonType.flat,
                        onPressed: value.onClearTitle,
                      ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class _InputContent extends StatelessWidget {
  const _InputContent({super.key});

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
        Consumer<QuestionAddViewModel>(
          builder: (context, value, child) {
            return TextField(
              controller: value.contentController,
              keyboardType: TextInputType.multiline,
              maxLength: 500,
              maxLines: 10,
              onChanged: (text) => value.onChangeContent(text),
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
            );
          },
        ),
      ],
    );
  }
}

class _InputNickname extends StatelessWidget {
  const _InputNickname({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '닉네임',
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
        Consumer<QuestionAddViewModel>(
          builder: (context, value, child) {
            return TextField(
              controller: value.nicknameController,
              keyboardType: TextInputType.text,
              onChanged: (text) => value.onChangeNickname(text),
              inputFormatters: [
                LengthLimitingTextInputFormatter(10),
              ],
              decoration: InputDecoration(
                hintText: '닉네임을 입력해 주세요',
                errorText: value.nicknameErrMsg,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    width: 1,
                  ),
                ),
                suffixIcon: value.nicknameController.text.isEmpty
                    ? null
                    : Button(
                        iconPath: AssetIconType.close.path,
                        color: Colors.black,
                        type: ButtonType.flat,
                        onPressed: value.onClearNickname,
                      ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class _InputPassword extends StatelessWidget {
  const _InputPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '비밀번호',
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
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            vertical: 7,
            horizontal: 14,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: context.color.descriptionBackground,
          ),
          child: Center(
            child: Text(
              '비밀번호가 있어야 내가 작성한 글을 수정/삭제할 수 있어요! 꼭 기억해 주세요!',
              style: context.typo.body3,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Consumer<QuestionAddViewModel>(
          builder: (context, value, child) {
            return TextField(
              controller: value.passwordController,
              keyboardType: TextInputType.number,
              obscureText: true,
              onChanged: (text) => value.onChangePassword(text),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(8),
              ],
              decoration: InputDecoration(
                hintText: '숫자4자리~8자리로 구성해주세요',
                errorText: value.passwordErrMsg,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    width: 1,
                  ),
                ),
                suffixIcon: value.passwordController.text.isEmpty
                    ? null
                    : Button(
                        iconPath: AssetIconType.close.path,
                        color: Colors.black,
                        type: ButtonType.flat,
                        onPressed: value.onClearPassword,
                      ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<QuestionAddViewModel>(
      builder: (context, value, child) {
        return Button(
          onPressed: () =>
              value.isActiveSubmitButton ? value.onSubmit(context) : null,
          isInactive: !value.isActiveSubmitButton,
          width: double.infinity,
          text: '질문 등록',
          size: ButtonSize.large,
        );
      },
    );
  }
}
