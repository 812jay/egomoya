import 'package:egomoya/src/service/theme_service.dart';
import 'package:egomoya/src/view/base_view.dart';
import 'package:egomoya/src/view/main/main_view_model.dart';
import 'package:egomoya/theme/component/button/category_button.dart';
import 'package:egomoya/theme/component/icon/asset_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: MainViewModel(
        context.read(),
      ),
      builder: (context, viewModel) {
        return Scaffold(
          body: SafeArea(
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return <Widget>[
                  const _MainAppBar(),
                  SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                      context,
                    ),
                    sliver: SliverPersistentHeader(
                      delegate: MainHeaderDelegate(),
                    ),
                  )
                ];
              },
              body: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Consumer<MainViewModel>(
                  builder: (context, value, child) {
                    return PageView.builder(
                      controller: value.pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return value.pageList[index];
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _MainAppBar extends StatelessWidget {
  const _MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      floating: true,
      elevation: 0,
      scrolledUnderElevation: 0,
      title: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: AssetIcon(
          'assets/svgs/logo.svg',
          color: context.color.error,
          size: 15,
        ),
      ),
      actions: const [
        AssetIcon(
          'assets/icons/alarm.svg',
          size: 22,
        ),
        SizedBox(width: 20),
        AssetIcon(
          'assets/icons/group.svg',
          size: 22,
        ),
        SizedBox(width: 20),
      ],
    );
  }
}

class MainHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Consumer<MainViewModel>(
      builder: (context, value, child) {
        return Container(
          height: 50,
          decoration: BoxDecoration(color: context.color.white),
          padding: const EdgeInsets.only(left: 20),
          alignment: Alignment.centerLeft,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: value.categoryList.length,
            separatorBuilder: (context, index) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              return CategoryButton(
                value.categoryList[index].title,
                isActive: value.categoryList[index].isActive,
                index: index,
                onTap: (index) => value.onTapCategory(index),
              );
            },
          ),
        );
      },
    );
  }

  @override
  double get maxExtent => 40;

  @override
  double get minExtent => 40;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
