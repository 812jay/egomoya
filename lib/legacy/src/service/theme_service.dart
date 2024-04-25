
// import 'package:egomoya/legacy/theme/dark_theme.dart';
// import 'package:egomoya/legacy/theme/foundation/app_theme.dart';
// import 'package:egomoya/legacy/theme/light_theme.dart';
// import 'package:egomoya/theme/res/layout.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class ThemeService with ChangeNotifier {
//   ThemeService({
//     AppTheme? theme,
//   }) : theme = theme ?? LightTheme();

//   /// 현재 테마
//   AppTheme theme;

//   /// 테마 변경
//   void toggleTheme() {
//     if (theme.brightness == Brightness.light) {
//       theme = DarkTheme();
//     } else {
//       theme = LightTheme();
//     }
//     notifyListeners();
//   }

//   /// Material ThemeData 커스텀
//   ThemeData get themeData {
//     return ThemeData(
//       /// Scaffold
//       scaffoldBackgroundColor: theme.color.white,

//       /// AppBar
//       appBarTheme: AppBarTheme(
//         backgroundColor: theme.color.white,
//         elevation: 0,
//         centerTitle: false,
//         iconTheme: IconThemeData(
//           color: theme.color.black,
//         ),
//         titleTextStyle: theme.typo.headline2.copyWith(
//           color: theme.color.black,
//         ),
//       ),

//       /// BottomSheet
//       bottomSheetTheme: const BottomSheetThemeData(
//         backgroundColor: Colors.transparent,
//         constraints: BoxConstraints(
//           maxWidth: Breakpoints.bottomSheet,
//         ),
//       ),
//     );
//   }
// }

// extension ThemeServiceExt on BuildContext {
//   ThemeService get themeService => watch<ThemeService>();
//   AppTheme get theme => themeService.theme;
//   AppColor get color => theme.color;
//   AppDeco get deco => theme.deco;
//   AppTypo get typo => theme.typo;
// }
