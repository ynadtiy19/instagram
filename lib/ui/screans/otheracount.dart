// import 'package:flutter/material.dart';
// import 'package:instgram_app/data/testmodel.dart';
// import 'package:instgram_app/ui/screans/ProfileScreen.dart';
// import 'package:instgram_app/ui/widget/bio.dart';
// import 'package:instgram_app/ui/widget/edit_profile.dart';
// import 'package:instgram_app/ui/widget/follow_other_profile.dart';

// import 'package:instgram_app/ui/widget/navigator_bar.dart';
// import 'package:instgram_app/ui/widget/under_navigator_bar.dart';

// class UserProfilePage extends StatelessWidget {
//   final User user;
//   final List<String> photosImages;
//   final List<String> photosDescriptions;
//   final List<String> videosImages;
//   final List<String> videosDescriptions;
//   UserProfilePage({
//     required this.user,
//     required this.photosImages,
//     required this.photosDescriptions,
//     required this.videosImages,
//     required this.videosDescriptions,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(user.username!),
//       ),
//       body: ListView(
//         shrinkWrap: true,
//         physics: BouncingScrollPhysics(),
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(height: 10),
//                 NavigatorBar(
//                   username: user.username!,
//                 ),
//                 SizedBox(height: 10),
//                 UnderNavigatorBar(
//                   imagee: user.imageUrl,
//                   name: user.name,
//                   numberPosts: user.posts,
//                   numberFollowers: user.followers,
//                   numberFollowing: user.following,
//                 ),
//                 SizedBox(height: 10),
//                 ExpandableText(
//                   text: user.bio,
//                 ),
//                 SizedBox(height: 15),
//                FollowOtherScreen(),
//                 SizedBox(height: 15),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 500,
//             child: ProfileScreen(
//               photosImages: photosImages,
//               photosDescriptions: photosDescriptions,
//               videosImages: videosImages,
//               videosDescriptions: videosDescriptions,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:instgram_app/data/testmodel.dart';
import 'package:instgram_app/ui/screans/ProfileScreen.dart';
import 'package:instgram_app/ui/widget/bio.dart';
import 'package:instgram_app/ui/widget/follow_other_profile.dart';
import 'package:instgram_app/ui/widget/navigator_bar.dart';
import 'package:instgram_app/ui/widget/under_navigator_bar.dart';

class UserProfilePage extends StatelessWidget {
  final User user;
  final List<String> photosImages;
  final List<String> photosDescriptions;
  final List<String> videosImages;
  final List<String> videosDescriptions;

  const UserProfilePage({
    super.key,
    required this.user,
    required this.photosImages,
    required this.photosDescriptions,
    required this.videosImages,
    required this.videosDescriptions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.username!),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                NavigatorBar(username: user.username!),
                const SizedBox(height: 10),
                UnderNavigatorBar(
                  imagee: user.imageUrl,
                  name: user.name,
                  numberPosts: user.posts,
                  numberFollowers: user.followers,
                  numberFollowing: user.following,
                ),
                const SizedBox(height: 10),
                ExpandableText(text: user.bio),
                const SizedBox(height: 15),
                FollowOtherScreen(user: user), //  تمرير المستخدم إلى FollowOtherScreen
                const SizedBox(height: 15),
              ],
            ),
          ),
          SizedBox(
            height: 500,
            child: ProfileScreen(
              photosImages: photosImages,
              photosDescriptions: photosDescriptions,
              videosImages: videosImages,
              videosDescriptions: videosDescriptions,
            ),
          ),
        ],
      ),
    );
  }
}


