import 'package:egomoya/src/service/theme_service.dart';
import 'package:egomoya/theme/foundation/app_theme.dart';
import 'package:flutter/material.dart';

class BaseBottomDialogContent {
  BaseBottomDialogContent({
    required this.title,
    required this.onTap,
  });
  final String title;
  final GestureTapCallback onTap;
}

class BaseBottomDialog extends StatelessWidget {
  const BaseBottomDialog({
    super.key,
    required this.contentList,
  });
  final List<BaseBottomDialogContent> contentList;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 26),
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
              ListView.separated(
                shrinkWrap: true,
                itemCount: contentList.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  return BaseBottomDialogButton(
                    content: contentList[index],
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class BaseBottomDialogButton extends StatelessWidget {
  const BaseBottomDialogButton({
    super.key,
    required this.content,
  });
  final BaseBottomDialogContent content;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: content.onTap,
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      child: Center(
        child: Text(
          content.title,
          style: context.typo.body1.bold,
        ),
      ),
    );
  }
}
