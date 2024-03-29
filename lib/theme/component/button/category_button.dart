import 'package:egomoya/src/service/theme_service.dart';
import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton(
    this.text, {
    super.key,
    required this.isActive,
    required this.index,
    this.onTap,
  });
  final String text;
  final bool isActive;
  final int index;
  final Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap != null ? () => onTap!(index) : null,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          color: isActive ? context.color.black : context.color.white,
          border: Border.all(
            width: 1,
            color: isActive ? context.color.black : context.color.grayText,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: Text(
            text,
            style: context.typo.body2.copyWith(
              color: isActive == true
                  ? context.color.white
                  : context.color.grayText,
              fontWeight: isActive == true ? FontWeight.bold : FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
