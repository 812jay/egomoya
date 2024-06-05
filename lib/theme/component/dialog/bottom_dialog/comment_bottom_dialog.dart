import 'package:egomoya/src/service/theme_service.dart';
import 'package:egomoya/theme/component/button/button.dart';
import 'package:egomoya/theme/component/icon/asset_icon.dart';
import 'package:egomoya/theme/component/icon/asset_icon_type.dart';
import 'package:egomoya/theme/foundation/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommentBottomDialog extends StatefulWidget {
  const CommentBottomDialog({
    super.key,
    this.prevComment,
    this.onTapUpdate,
  });
  final String? prevComment;
  final Function(String newComment)? onTapUpdate;

  @override
  State<CommentBottomDialog> createState() => _CommentBottomDialogState();
}

class _CommentBottomDialogState extends State<CommentBottomDialog> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController controller =
        TextEditingController(text: widget.prevComment ?? '');
    return Wrap(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 20),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(8),
              topLeft: Radius.circular(8),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '댓글 수정',
                      style: context.typo.subTitle3,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: AssetIcon(
                      AssetIconType.close.path,
                      size: 23,
                    ),
                  )
                ],
              ),
              TextField(
                controller: controller,
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 5,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(100),
                ],
                decoration: InputDecoration(
                  fillColor: context.color.lightGrayBackground,
                  filled: true,
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide.none,
                  ),
                  hintStyle: context.typo.body2.subText,
                  hintText: '수정 할 댓글을 입력해주세요',
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Button.text(
                context,
                text: '수정',
                isActive: true,
                onTap: () => widget.onTapUpdate!(controller.text),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
