import 'package:egomoya/src/model/celeb/celeb_type.dart';
import 'package:egomoya/src/service/theme_service.dart';
import 'package:egomoya/theme/foundation/app_theme.dart';
import 'package:flutter/material.dart';

class CelebCategoryForm extends StatelessWidget {
  const CelebCategoryForm({
    super.key,
    required this.categoryList,
    required this.selectedCategory,
    required this.onTap,
  });
  final List<CelebCategory> categoryList;
  final CelebCategory selectedCategory;
  final void Function(CelebCategory category) onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 44,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: context.color.subBackground,
                    width: 0.2,
                  ),
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: categoryList.length,
              itemBuilder: (context, index) {
                final category = categoryList[index];
                return _CategoryButton(
                  category: category,
                  isSelected: category == selectedCategory,
                  onTap: onTap,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  const _CategoryButton({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onTap,
  });
  final CelebCategory category;
  final bool isSelected;
  final void Function(CelebCategory category) onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(category),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected ? context.color.black : context.color.divider,
              width: isSelected ? 1 : 0,
            ),
          ),
        ),
        child: Text(
          category.ko,
          style: isSelected
              ? context.typo.subTitle3.bold
              : context.typo.body1.subText,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
