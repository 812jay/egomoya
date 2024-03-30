// import 'package:egomoya/src/view/base_view.dart';
// import 'package:egomoya/src/view/main/main_view_model.dart';
// import 'package:egomoya/src/view/main/widget/post_title.dart';
// import 'package:egomoya/theme/component/box/question_box.dart';
// import 'package:egomoya/util/route_path.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class HomeView extends StatelessWidget {
//   const HomeView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BaseView(
//       viewModel: MainViewModel(context.read()),
//       builder: (context, viewModel) {
//         return Column(
//           children: [
//             PostTitle(
//               onTap: () {},
//               title: '요고 궁금해요 TOP 3',
//             ),
//             const SizedBox(height: 26),
//             ListView.separated(
//               shrinkWrap: true,
//               itemCount: 3,
//               physics: const NeverScrollableScrollPhysics(),
//               separatorBuilder: (context, index) => const SizedBox(height: 13),
//               itemBuilder: (context, index) {
//                 return QuestionBox(
//                   onTap: () => Navigator.pushNamed(
//                     context,
//                     RoutePath.questionDetail,
//                     arguments: index,
//                   ),
//                   title: 'title$index',
//                   content: 'content$index',
//                   writedAt: DateTime.now().subtract(
//                     const Duration(days: 1),
//                   ),
//                   commentCnt: 3,
//                 );
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
