import 'package:carousel_slider/carousel_slider.dart';
import 'package:egomoya/src/model/celeb/celeb.dart';
import 'package:egomoya/src/repo/celeb_repo.dart';
import 'package:egomoya/src/repo/image_repo.dart';
import 'package:egomoya/src/repo/user_repo.dart';
import 'package:egomoya/src/service/user_service.dart';
import 'package:egomoya/src/view/base_view.dart';
import 'package:egomoya/src/view/celeb/widget/celeb_card.dart';
import 'package:egomoya/src/view/home/main_view_model.dart';
import 'package:egomoya/theme/component/main_sliver_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: MainViewModel(
        celebRepo: context.read<CelebRepo>(),
        imageRepo: context.read<ImageRepo>(),
        userRepo: context.read<UserRepo>(),
        userService: context.read<UserService>(),
      ),
      builder: (context, viewModel) {
        return Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                MainSliverAppBar(
                  user: viewModel.user,
                  profileImgUrl: viewModel.profileImgUrl,
                ),
              ];
            },
            body: Column(
              children: [
                _CelebCarousel(
                  celebList: viewModel.celebList,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _CelebCarousel extends StatelessWidget {
  const _CelebCarousel({
    super.key,
    required this.celebList,
  });
  final List<Celeb> celebList;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: celebList.length,
      options: CarouselOptions(
        scrollDirection: Axis.horizontal,
        initialPage: 0,
        enableInfiniteScroll: false,
        height: 400,
        viewportFraction: 0.85,
        enlargeFactor: 0.2,
        enlargeCenterPage: true,
        autoPlayCurve: Curves.easeInOut,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(seconds: 1),
        pauseAutoPlayInFiniteScroll: true,
        autoPlay: true,
      ),
      itemBuilder: (context, index, realIndex) {
        final celeb = celebList[index];
        return CelebCard(celeb: celeb);
      },
    );
  }
}
