import 'package:egomoya/src/service/theme_service.dart';
import 'package:egomoya/theme/component/button/button.dart';
import 'package:flutter/material.dart';

class BaseDialog extends StatelessWidget {
  const BaseDialog({
    super.key,
    this.content,
    this.onTapCancel,
    this.onTapConfirm,
    this.cancelText,
    this.confirmText,
  });
  final String? content;
  final GestureTapCallback? onTapCancel;
  final GestureTapCallback? onTapConfirm;
  final String? cancelText;
  final String? confirmText;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(20),
      content: Text(
        content ?? '',
        style: context.typo.subtitle1,
      ),
      actions: [
        Row(
          children: [
            Expanded(
              child: Button(
                backgroundColor: context.color.inactive,
                onPressed: onTapCancel ??
                    () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                text: cancelText ?? '나가기',
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Button(
                onPressed: onTapConfirm ?? () => Navigator.pop(context),
                text: confirmText ?? '계속 작성하기',
              ),
            ),
          ],
        )
      ],
    );
  }
}