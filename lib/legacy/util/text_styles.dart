// part of 'app_theme.dart';

// class FontSizes {
//   static double get scale => 1;
//   static double get s10 => 10 * scale;
//   static double get s11 => 11 * scale;
//   static double get s12 => 12 * scale;
//   static double get s13 => 13 * scale;
//   static double get s14 => 14 * scale;
//   static double get s13_5 => 13.5 * scale;
//   static double get s15 => 15 * scale;
//   static double get s18 => 18 * scale;
//   static double get s21 => 21 * scale;
//   static double get s24 => 24 * scale;
//   static double get s30 => 30 * scale;
//   static double get s32 => 32 * scale;
// }

// class Fonts {
//   static const String spoqa = 'Spoqa Han Sans Neo';
// }

// // class TextStyles {
// //   TextStyles._();

// //   /// 14
// //   static TextStyle body2 = TextStyle(
// //     fontFamily: Fonts.spoqa,
// //     color: Palette.gray2,
// //     fontWeight: FontWeight.normal,
// //     fontSize: 14,
// //     height: 1.4,
// //   ); // height: 140%

// //   static TextStyle second =
// //       body2.copyWith(fontSize: FontSizes.s30, fontWeight: FontWeight.bold);
// //   static TextStyle h2 =
// //       body2.copyWith(fontSize: FontSizes.s24, fontWeight: FontWeight.bold);
// //   static TextStyle thumbnailTitle = body2.copyWith(fontSize: 40);

// //   /// 24
// //   static TextStyle headline1 =
// //       body2.copyWith(fontSize: 24, height: 1.4); // height: 140%
// //   /// 20
// //   static TextStyle headline2 =
// //       body2.copyWith(fontSize: 20, height: 1.4); // height: 140%
// //   /// 18
// //   static TextStyle headline3 =
// //       body2.copyWith(fontSize: 18, height: 1.4); // height: 140%
// //   /// 16
// //   static TextStyle body1 =
// //       body2.copyWith(fontSize: 16, height: 1.4); // height: 140%
// //   /// 12
// //   static TextStyle caption1 =
// //       body2.copyWith(fontSize: 12, height: 1.5); // height: 150%
// //   /// 10
// //   static TextStyle caption2 =
// //       body2.copyWith(fontSize: 10, height: 1.5); // height: 150%

// //   static TextStyle get emptyList => body2.subColor;
// //   static TextStyle get labelText => body2;
// //   static TextStyle get dialogContent => body2.fromColor(Palette.gray2);
// //   static TextStyle feedBody = TextStyles.body2.light.copyWith(height: 1.5);
// //   static TextStyle todoMainText = TextStyles.body2.medium;
// //   static TextStyle todoChildText = TextStyles.caption1.medium;

// //   // 나중에 Light,Dark Theme 기능 추가 시 활용
// //   // 지금은 default font 용도로만
// //   static TextTheme makeTextTheme() => TextTheme(
// //         displayLarge: body2.copyWith(
// //           fontSize: 94,
// //           fontWeight: FontWeight.w300,
// //           letterSpacing: -1.5,
// //         ),
// //         displayMedium: body2.copyWith(
// //           fontSize: 59,
// //           fontWeight: FontWeight.w300,
// //           letterSpacing: -0.5,
// //         ),
// //         displaySmall: body2.copyWith(
// //           fontSize: 47,
// //           fontWeight: FontWeight.w400,
// //         ),
// //         headlineMedium: body2.copyWith(
// //           fontSize: 33,
// //           fontWeight: FontWeight.w400,
// //           letterSpacing: 0.25,
// //         ),
// //         headlineSmall: body2.copyWith(
// //           fontSize: 24,
// //           fontWeight: FontWeight.w500,
// //         ),
// //         titleLarge: body2.copyWith(
// //           fontSize: 20,
// //           fontWeight: FontWeight.w500,
// //           letterSpacing: 0.15,
// //         ),
// //         titleMedium: body2.copyWith(
// //           fontSize: 19,
// //           fontWeight: FontWeight.w400,
// //           letterSpacing: 0.15,
// //         ),
// //         titleSmall: body2.copyWith(
// //           fontSize: 18,
// //           fontWeight: FontWeight.w500,
// //           letterSpacing: 0.1,
// //         ),
// //         bodyLarge: body2.copyWith(
// //           fontSize: 17,
// //           fontWeight: FontWeight.w400,
// //           letterSpacing: 0.5,
// //         ),
// //         bodyMedium: body2, // default 폰트 (style 값 null일 때 bodyMedium 적용)
// //         bodySmall: body2.copyWith(
// //           fontSize: 15,
// //           fontWeight: FontWeight.w400,
// //           letterSpacing: 1.25,
// //         ),
// //         labelLarge: body2.copyWith(
// //           fontSize: 14,
// //           fontWeight: FontWeight.w400,
// //           letterSpacing: 0.4,
// //         ),
// //         labelSmall: body2.copyWith(
// //           fontSize: 12,
// //           fontWeight: FontWeight.w400,
// //           letterSpacing: 1.5,
// //         ),
// //       );
// // }

// extension TextStyleExt on TextStyle {
//   TextStyle fromColor(Color? color) => copyWith(color: color ?? Palette.black);

//   TextStyle get bold => copyWith(fontWeight: FontWeight.w700);
//   TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);
//   TextStyle get medium => copyWith(fontWeight: FontWeight.w500);
//   TextStyle get regular => copyWith(fontWeight: FontWeight.normal);
//   TextStyle get light => copyWith(fontWeight: FontWeight.w300);

//   TextStyle get mainColor => copyWith(color: Palette.hotPink);
//   TextStyle get secondaryColor => copyWith(color: Palette.pink);
//   TextStyle get whiteColor => copyWith(color: Palette.white);
//   TextStyle get subColor => copyWith(color: Palette.subBlue);
//   TextStyle get subText => copyWith(color: Palette.gray4);
//   TextStyle get pointColor => copyWith(color: Palette.red);

//   TextStyle get underline => copyWith(decoration: TextDecoration.underline);
//   TextStyle get lineThrough => copyWith(decoration: TextDecoration.lineThrough);
// }
