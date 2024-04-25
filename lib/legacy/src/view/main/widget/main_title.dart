// import 'package:egomoya/legacy/src/service/theme_service.dart';
// import 'package:egomoya/legacy/util/app_theme.dart';
// import 'package:flutter/material.dart';

// class MainTitle extends StatelessWidget {
//   const MainTitle({
//     super.key,
//     this.onTap,
//     this.title,
//   });
//   final GestureTapCallback? onTap;
//   final String? title;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Row(
//         children: [
//           Expanded(
//             child: Text(
//               title ?? '',
//               style: context.typo.subTitle3,
//             ),
//           ),
//           Text(
//             '더 보기',
//             style: context.typo.body2.fromColor(
//               context.color.subText,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
