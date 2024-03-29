import 'package:egomoya/src/service/theme_service.dart';
import 'package:egomoya/theme/component/icon/asset_icon.dart';
import 'package:egomoya/util/app_theme.dart';
import 'package:flutter/material.dart';

part 'button_size.dart';
part 'button_type.dart';

class Button extends StatefulWidget {
  const Button({
    super.key,
    required this.onPressed,
    this.text,
    this.iconPath,
    this.width,
    this.color,
    this.backgroundColor,
    this.borderColor,
    ButtonType? type,
    ButtonSize? size,
    isInactive,
  })  : type = type ?? ButtonType.fill,
        size = size ?? ButtonSize.medium,
        isInactive = isInactive ?? false;

  ///클릭 이벤트
  final void Function() onPressed;

  ///버튼 타입&크기
  final ButtonType type;
  final ButtonSize size;

  ///비활성화 여부
  final bool isInactive;

  ///텍스트&아이콘
  final String? text;
  final String? iconPath;

  ///폭
  final double? width;

  ///커스텀 색상
  final Color? color;
  final Color? backgroundColor;
  final Color? borderColor;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  ///버튼이 눌려있는지 여부
  bool isPressed = false;

  ///비활성화 여부
  bool get isInactive => isPressed || widget.isInactive;

  ///Text && Icon Color
  Color get color => widget.type.getColor(
        context,
        isInactive,
        widget.color,
      );
  Color get backgroundColor => widget.type.getBackgroundColor(
        context,
        isInactive,
        widget.backgroundColor,
      );

  ///Border
  Border? get border => widget.type.getBorder(
        context,
        isInactive,
        widget.borderColor,
      );

  ///버튼 클릭 이벤트
  void onPressed(bool isNewPressed) {
    if (isPressed == isNewPressed) return;
    setState(() {
      isPressed = isNewPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (details) {
        onPressed(false);
        if (!widget.isInactive) {
          widget.onPressed();
        }
      },
      onTapDown: (details) => onPressed(true),
      onTapCancel: () => onPressed(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        width: widget.width,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
          border: border,
        ),
        padding: EdgeInsets.all(widget.size.padding),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Icon
            if (widget.iconPath != null)
              AssetIcon(
                widget.iconPath!,
                color: color,
              ),

            /// Gap
            if (widget.iconPath != null && widget.text != null)
              const SizedBox(width: 8),

            /// Text
            if (widget.text != null)
              Text(
                widget.text!,
                style: context.typo.body1.bold.whiteColor,
              ),
          ],
        ),
      ),
    );
  }
}
