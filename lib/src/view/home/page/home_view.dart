import 'package:carousel_slider/carousel_slider.dart';
import 'package:egomoya/src/model/celeb/celeb.dart';
import 'package:egomoya/src/view/celeb/widget/celeb_card.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
    required this.celebList,
  });
  final List<Celeb> celebList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CelebCarousel(celebList: celebList),
      ],
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
