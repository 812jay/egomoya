import 'package:flutter/material.dart';

abstract class Typo {
  const Typo({
    required this.name,
    required this.bold,
    required this.semiBold,
    required this.boldMedium,
    required this.boldRegular,
    required this.regular,
  });

  final String name;
  final FontWeight bold;
  final FontWeight semiBold;
  final FontWeight boldMedium;
  final FontWeight boldRegular;
  final FontWeight regular;
}

class NotoSans implements Typo {
  const NotoSans();

  @override
  final String name = 'noto_sans';

  @override
  final FontWeight bold = FontWeight.w700;

  @override
  final FontWeight semiBold = FontWeight.w600;

  @override
  final FontWeight boldMedium = FontWeight.w500;

  @override
  final FontWeight boldRegular = FontWeight.w400;

  @override
  final FontWeight regular = FontWeight.w300;
}
