import 'dart:developer';

import 'package:egomoya/src/service/theme_service.dart';
import 'package:egomoya/util/app_theme.dart';
import 'package:flutter/material.dart';

class PostEditDialog extends StatelessWidget {
  const PostEditDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      width: double.infinity,
      height: 200,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(8),
          topLeft: Radius.circular(8),
        ),
      ),
      child: Column(
        children: [
          Container(
            width: 50,
            height: 4,
            margin: const EdgeInsets.only(top: 9),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: context.color.grayText,
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                log('수정');
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              child: Center(
                child: Text(
                  '수정',
                  style: context.typo.body1.bold,
                ),
              ),
            ),
          ),
          const Divider(),
          Expanded(
            child: TextButton(
              onPressed: () {
                log('삭제');
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              child: Center(
                child: Text(
                  '삭제',
                  style: context.typo.body1.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
