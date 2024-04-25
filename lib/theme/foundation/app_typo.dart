part of 'app_theme.dart';

class AppTypo {
  AppTypo({
    required this.typo,
    required this.fontColor,
  });

  /// Typo
  final Typo typo;

  /// Font Weight
  late FontWeight bold = typo.bold;
  late FontWeight semiBold = typo.semiBold;
  late FontWeight boldMedium = typo.boldMedium;
  late FontWeight boldRegular = typo.boldRegular;
  late FontWeight regular = typo.regular;

  /// Font Color
  final Color fontColor;

  /// Headline
  late final TextStyle headline1 = TextStyle(
    height: 1.19,
    fontFamily: typo.name,
    fontWeight: typo.bold,
    fontSize: 24,
    color: fontColor,
  );
  late final TextStyle headline2 = TextStyle(
    height: 1.19,
    fontFamily: typo.name,
    fontWeight: typo.bold,
    fontSize: 22,
    color: fontColor,
  );

  // SubTItle
  late final TextStyle subTitle1 = TextStyle(
    height: 1.19,
    fontFamily: typo.name,
    fontWeight: typo.bold,
    fontSize: 20,
    color: fontColor,
  );
  late final TextStyle subTitle2 = TextStyle(
    height: 1.19,
    fontFamily: typo.name,
    fontWeight: typo.semiBold,
    fontSize: 20,
    color: fontColor,
  );

  late final TextStyle subTitle3 = TextStyle(
    height: 1.19,
    fontFamily: typo.name,
    fontWeight: typo.semiBold,
    fontSize: 18,
    color: fontColor,
  );

  /// Body
  late final TextStyle body1 = TextStyle(
    height: 1.19,
    fontFamily: typo.name,
    fontWeight: typo.regular,
    fontSize: 16,
    color: fontColor,
  );
  late final TextStyle body2 = TextStyle(
    height: 1.19,
    fontFamily: typo.name,
    fontWeight: typo.regular,
    fontSize: 14,
    color: fontColor,
  );
  late final TextStyle body3 = TextStyle(
    height: 1.19,
    fontFamily: typo.name,
    fontWeight: typo.regular,
    fontSize: 12,
    color: fontColor,
  );
}

extension TypoExt on TextStyle {
  TextStyle fromColor(Color? color) => copyWith(color: color ?? Palette.black);

  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);
  TextStyle get regular => copyWith(fontWeight: FontWeight.normal);
  TextStyle get light => copyWith(fontWeight: FontWeight.w300);

  TextStyle get mainColor => copyWith(color: Palette.hotPink);
  TextStyle get secondaryColor => copyWith(color: Palette.pink);
  TextStyle get whiteColor => copyWith(color: Palette.white);
  TextStyle get subColor => copyWith(color: Palette.subBlue);
  TextStyle get subText => copyWith(color: Palette.gray4);
  TextStyle get pointColor => copyWith(color: Palette.red);

  TextStyle get underline => copyWith(decoration: TextDecoration.underline);
  TextStyle get lineThrough => copyWith(decoration: TextDecoration.lineThrough);
}
