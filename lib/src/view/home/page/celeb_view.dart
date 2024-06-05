import 'package:egomoya/src/model/celeb/celeb.dart';
import 'package:egomoya/src/model/celeb/celeb_type.dart';
import 'package:egomoya/src/view/celeb/widget/celeb_card.dart';
import 'package:egomoya/src/view/celeb/widget/celeb_category_form.dart';
import 'package:flutter/material.dart';

class CelebView extends StatelessWidget {
  const CelebView({
    super.key,
    required this.celebList,
    required this.selectedCelebCategory,
    required this.onTapCelebCategory,
  });
  final List<Celeb> celebList;
  final CelebCategory selectedCelebCategory;
  final void Function(CelebCategory category) onTapCelebCategory;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 26),
            child: CelebCategoryForm(
              categoryList: CelebCategory.values,
              selectedCategory: selectedCelebCategory,
              onTap: onTapCelebCategory,
            ),
          ),
          ListView.separated(
            itemCount: celebList.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            separatorBuilder: (context, index) => const SizedBox(height: 20),
            itemBuilder: (context, index) {
              final celeb = celebList[index];
              return CelebCard(celeb: celeb);
            },
          ),
        ],
      ),
    );
  }
}
