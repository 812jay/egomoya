import 'dart:developer';

import 'package:egomoya/src/service/theme_service.dart';
import 'package:egomoya/src/view/base_view.dart';
import 'package:egomoya/src/view/question/question_detail_view_model.dart';
import 'package:egomoya/theme/component/app_bar/base_app_bar.dart';
import 'package:egomoya/util/helper/datetime_helper.dart';
import 'package:flutter/material.dart';

class QuestionDetailView extends StatelessWidget {
  const QuestionDetailView({
    super.key,
    required this.postId,
  });
  final int postId;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: QuestionDetailViewModel(postId: postId),
      builder: (context, viewModel) {
        return Scaffold(
          appBar: BaseAppBar(
            title: Text(
              '질문 상세',
              style: context.typo.appbarTitle,
            ),
          ),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Title',
                                style: context.typo.headline6,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              DateTime.now()
                                  .subtract(const Duration(seconds: 1))
                                  .formatRelativeDateTime(),
                              style: context.typo.body1,
                            )
                          ],
                        ),
                        Text(
                          'id',
                          style: context.typo.body2,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'content',
                          style: context.typo.body1,
                        ),
                        const SizedBox(height: 20),
                        ListView.separated(
                          shrinkWrap: true,
                          itemCount: 3,
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 20),
                          itemBuilder: (context, index) {
                            return Container(
                              height: 284,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(width: 1),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Center(child: Text('image$index')),
                            );
                          },
                        ),
                        const SizedBox(height: 25),
                        const Divider(height: 1, color: Colors.black),
                        const SizedBox(height: 25),
                        //댓글 목록
                        Text(
                          '댓글',
                          style: context.typo.subtitle2,
                        ),
                        const SizedBox(height: 25),
                        ListView.separated(
                          shrinkWrap: true,
                          itemCount: 3,
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 25),
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'id',
                                        style: context.typo.body2,
                                      ),
                                    ),
                                    Text(
                                      '답글',
                                      style: context.typo.body2,
                                    )
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'content$index',
                                  style: context.typo.body2,
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    DateTime.now()
                                        .subtract(const Duration(minutes: 3))
                                        .formatRelativeDateTime(),
                                    style: context.typo.body2,
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                //댓글 등록
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(width: 1),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 52,
                            child: TextField(
                              textAlignVertical: TextAlignVertical.bottom,
                              decoration: InputDecoration(
                                fillColor: context.color.hint,
                                filled: true,
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(100),
                                  ),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: '알고있는 상품이라면 댓글을 달아주세요!',
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(100),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            log('등록');
                          },
                          child: Container(
                            width: 60,
                            alignment: Alignment.center,
                            child: Text(
                              '등록',
                              style: context.typo.body1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
