// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:egomoya/legacy/src/data/dto/user/user.dart';
// import 'package:egomoya/legacy/src/service/theme_service.dart';
// import 'package:egomoya/legacy/src/view/profile/profile_view_model.dart';
// import 'package:egomoya/legacy/theme/component/icon/asset_icon.dart';
// import 'package:egomoya/legacy/util/route_path.dart';
// import 'package:flutter/material.dart';

// class MainSliverAppBar extends StatelessWidget {
//   const MainSliverAppBar({
//     super.key,
//     this.user,
//   });
//   final User? user;

//   @override
//   Widget build(BuildContext context) {
//     return SliverAppBar(
//       titleSpacing: 0,
//       automaticallyImplyLeading: false,
//       floating: true,
//       elevation: 0,
//       scrolledUnderElevation: 0,
//       title: Padding(
//         padding: const EdgeInsets.only(left: 20),
//         child: AssetIcon(
//           'assets/svgs/logo_text.svg',
//           color: context.color.error,
//           size: 15,
//         ),
//       ),
//       actions: [
//         const AssetIcon(
//           'assets/icons/alarm.svg',
//           size: 22,
//         ),
//         const SizedBox(width: 20),
//         user != null
//             ? GestureDetector(
//                 onTap: () => Navigator.pushNamed(
//                   context,
//                   RoutePath.profile,
//                   arguments: ProfileViewArgument(user: user!),
//                 ),
//                 child: user!.profileImg != null
//                     ? CircleAvatar(
//                         maxRadius: 13,
//                         backgroundImage: CachedNetworkImageProvider(
//                           user!.profileImg!.imageUrl,
//                         ),
//                       )
//                     : const AssetIcon(
//                         'assets/icons/group.svg',
//                         size: 22,
//                       ),
//               )
//             : GestureDetector(
//                 onTap: () => Navigator.pushNamed(
//                   context,
//                   RoutePath.signIn,
//                 ),
//                 child: Text(
//                   '로그인',
//                   style: context.typo.body2,
//                 ),
//               ),
//         const SizedBox(width: 20),
//       ],
//     );
//   }
// }
