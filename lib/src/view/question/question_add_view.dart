import 'package:egomoya/src/service/theme_service.dart';
import 'package:egomoya/src/view/base_view.dart';
import 'package:egomoya/src/view/question/question_add_view_model.dart';
import 'package:egomoya/src/view/question/widget/image_box.dart';
import 'package:egomoya/theme/component/button/button.dart';
import 'package:egomoya/theme/component/icon/asset_icon.dart';
import 'package:egomoya/theme/component/icon/asset_icon_type.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuestionAddView extends StatelessWidget {
  const QuestionAddView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: QuestionAddViewModel(),
      builder: (context, viewModel) {
        return Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: AssetIcon(
                AssetIconType.close.path,
                size: 10,
              ),
            ),
            centerTitle: true,
            title: Text(
              '질문 등록',
              style: context.typo.appbarTitle,
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
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
                          itemCount: viewModel.images.length + 1,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                index == 0
                                    ? ImageAddContainer(
                                        onTap: viewModel.selectImage,
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        height: 122,
                                        width: 133,
                                        limitCnt: 5,
                                        curCnt: viewModel.images.length,
                                      )
                                    : ImageBox(
                                        imgPath:
                                            viewModel.images[index - 1].path,
                                        onDelete: () =>
                                            viewModel.onDeleteImage(index - 1),
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
                  const SizedBox(height: 15),
                  Text(
                    '제목',
                    style: context.typo.textFormTitle,
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: viewModel.titleController,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) => viewModel.onChangeTitle(value),
                    decoration: InputDecoration(
                      hintText: '제목을 입력해 주세요',
                      // errorText: '',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          width: 1,
                        ),
                      ),
                      suffixIcon: viewModel.titleController.text.isEmpty
                          ? null
                          : Button(
                              iconPath: AssetIconType.close.path,
                              color: Colors.black,
                              type: ButtonType.flat,
                              onPressed: viewModel.onClearTitle,
                            ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    '내용',
                    style: context.typo.textFormTitle,
                  ),
                  const SizedBox(height: 12),
                  Consumer<QuestionAddViewModel>(
                    builder: (context, value, child) {
                      return TextField(
                        controller: viewModel.contentController,
                        maxLines: 10,
                        onChanged: viewModel.onChangeContent,
                        decoration: InputDecoration(
                          hintText: '내용을 입력해 주세요',
                          // errorText: '',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              width: 1,
                            ),
                          ),
                          suffixIcon: viewModel.titleController.text.isEmpty
                              ? null
                              : Button(
                                  iconPath: AssetIconType.close.path,
                                  color: Colors.black,
                                  type: ButtonType.flat,
                                  onPressed: viewModel.onClearTitle,
                                ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 15),
                  Consumer<QuestionAddViewModel>(
                    builder: (context, value, child) {
                      return Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '${value.content.length}/500',
                          style: context.typo.textFormTitle,
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 15),
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
                    controller: viewModel.passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    onChanged: (value) => viewModel.onChangeTitle(value),
                    decoration: InputDecoration(
                      hintText: '숫자4자리~8자리로 구성해주세요',
                      // errorText: '',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          width: 1,
                        ),
                      ),
                      suffixIcon: viewModel.titleController.text.isEmpty
                          ? null
                          : Button(
                              iconPath: AssetIconType.close.path,
                              color: Colors.black,
                              type: ButtonType.flat,
                              onPressed: viewModel.onClearTitle,
                            ),
                    ),
                  ),
                  const SizedBox(height: 23),
                  Button(
                    onPressed: () {},
                    width: double.infinity,
                    text: '질문 등록',
                    size: ButtonSize.large,
                  ),
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
