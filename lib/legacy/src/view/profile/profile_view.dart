// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:egomoya/legacy/src/model/user_model.dart';
// import 'package:egomoya/legacy/src/service/theme_service.dart';
// import 'package:egomoya/legacy/src/view/base_view.dart';
// import 'package:egomoya/legacy/src/view/profile/profile_view_model.dart';
// import 'package:egomoya/legacy/src/view/sign_up/sign_up_view_model.dart';
// import 'package:egomoya/legacy/theme/component/app_bar/base_app_bar.dart';
// import 'package:egomoya/legacy/theme/component/button/button.dart';
// import 'package:egomoya/legacy/util/route_path.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class ProfileView extends StatelessWidget {
//   const ProfileView({
//     super.key,
//     required this.args,
//   });
//   final ProfileViewArgument args;

//   @override
//   Widget build(BuildContext context) {
//     return BaseView(
//       viewModel: ProfileViewModel(
//         userModel: context.read<UserModel>(),
//         args: args,
//       ),
//       builder: (context, viewModel) {
//         return Scaffold(
//           appBar: const BaseAppBar(title: '마이페이지'),
//           body: SafeArea(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         CircleAvatar(
//                           backgroundImage: CachedNetworkImageProvider(
//                             viewModel.userInfo.profileImg!.imageUrl,
//                           ),
//                           backgroundColor: context.color.lightGrayBackground,
//                         ),
//                         const SizedBox(width: 10),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Expanded(
//                                     child: Text(
//                                       '${viewModel.userInfo.nickname}님',
//                                       style: context.typo.body2,
//                                     ),
//                                   ),
//                                   GestureDetector(
//                                     onTap: () => Navigator.pushNamed(
//                                         context, RoutePath.signUp,
//                                         arguments: SignUpViewArgument(
//                                           user: viewModel.userInfo,
//                                         )),
//                                     child: Text(
//                                       '프로필 수정',
//                                       style: context.typo.body2,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 20),
//                     Align(
//                       alignment: Alignment.centerRight,
//                       child: Button(
//                         onPressed: () => viewModel.signOut(context),
//                         text: '로그아웃',
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
