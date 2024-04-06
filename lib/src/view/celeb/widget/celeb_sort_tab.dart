import 'package:egomoya/src/data/enum/celeb_type.dart';
import 'package:egomoya/src/service/theme_service.dart';
import 'package:egomoya/util/app_theme.dart';
import 'package:flutter/material.dart';

class CelebSortTab extends StatelessWidget {
  const CelebSortTab({
    super.key,
    required this.sort,
    required this.onTap,
    required this.isSelected,
  });
  final CelebPostSort sort;
  final void Function(CelebPostSort sort) onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(sort),
      child: Text(
        sort.name,
        style: isSelected
            ? context.typo.body2.subColor
            : context.typo.body2.subText,
      ),
    );
  }
}
