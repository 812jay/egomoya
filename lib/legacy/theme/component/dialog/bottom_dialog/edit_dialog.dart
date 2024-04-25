// import 'package:egomoya/lagacy/src/service/theme_service.dart';
// import 'package:egomoya/lagacy/util/app_theme.dart';
// import 'package:flutter/material.dart';

// class EditDialog extends StatelessWidget {
//   const EditDialog({
//     super.key,
//     this.onUpdate,
//     this.onDelete,
//   });
//   final GestureTapCallback? onUpdate;
//   final GestureTapCallback? onDelete;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 26),
//       width: double.infinity,
//       height: 200,
//       decoration: const BoxDecoration(
//         borderRadius: BorderRadius.only(
//           topRight: Radius.circular(8),
//           topLeft: Radius.circular(8),
//         ),
//       ),
//       child: Column(
//         children: [
//           Container(
//             width: 50,
//             height: 4,
//             margin: const EdgeInsets.only(top: 9),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: context.color.grayText,
//             ),
//           ),
//           Expanded(
//             child: TextButton(
//               onPressed: onUpdate,
//               style: ButtonStyle(
//                 shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                   RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               ),
//               child: Center(
//                 child: Text(
//                   '수정',
//                   style: context.typo.body1.bold,
//                 ),
//               ),
//             ),
//           ),
//           const Divider(),
//           Expanded(
//             child: TextButton(
//               onPressed: onDelete,
//               style: ButtonStyle(
//                 shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                   RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               ),
//               child: Center(
//                 child: Text(
//                   '삭제',
//                   style: context.typo.body1.bold,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
