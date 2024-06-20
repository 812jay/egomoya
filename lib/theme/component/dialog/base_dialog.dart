import 'package:egomoya/src/service/theme_service.dart';
import 'package:egomoya/theme/component/button/button.dart';
import 'package:flutter/material.dart';

class BaseDialog extends StatelessWidget {
  const BaseDialog({
    super.key,
    this.content,
    required this.actions,
  });
  final String? content;
  final List<Widget> actions;

  factory BaseDialog.check(
    context, {
    String? content,
    String? cancelText,
    String? confirmText,
    GestureTapCallback? onTapCancel,
    GestureTapCallback? onTapConfirm,
  }) {
    return BaseDialog(
      content: content,
      actions: [
        Row(
          children: [
            Expanded(
              child: Button.text(
                context,
                text: cancelText ?? '취소',
                isActive: false,
                onTap: onTapCancel,
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Button.text(
                context,
                text: confirmText ?? '확인',
                isActive: true,
                onTap: onTapConfirm,
              ),
            ),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(horizontal: 38, vertical: 32),
      content: Text(
        content ?? '',
        style: context.typo.body1,
      ),
      actions: actions,
    );
  }
}
