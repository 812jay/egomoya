import 'package:egomoya/src/service/theme_service.dart';
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
        ],
      ),
    );
  }

}

class BaseBottomDialogButton extends StatelessWidget {
  const BaseBottomDialogButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
