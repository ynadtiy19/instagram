
import 'package:flutter/material.dart';
import 'package:instgram_app/data/testmodel.dart';
import 'package:instgram_app/ui/other_profile/ProfileScreen.dart';
import 'package:instgram_app/ui/widget/bio.dart';
import 'package:instgram_app/ui/widget/follow_other_profile.dart';
import 'package:instgram_app/ui/widget/navigator_bar.dart';
import 'package:instgram_app/ui/widget/under_navigator_bar.dart';

class UserrProfilePage extends StatelessWidget {
  final User user;
  final List<String> photosImages;
  final List<String> photosDescriptions;
  final List<String> videosImages;
  final List<String> videosDescriptions;

  const UserrProfilePage({
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
        title: Text(user.username ?? "Unknown"), // ✅ تجنب الأخطاء عند null
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
                NavigatorBar(username: user.username ?? "Unknown"), // ✅ تمرير اسم المستخدم الصحيح
                const SizedBox(height: 10),
                UnderNavigatorBar(
                  imagee: user.imageUrl ?? "assets/images/default_user.jpeg", // ✅ صورة افتراضية عند null
                  name: user.name,
                  numberPosts: user.posts,
                  numberFollowers: user.followers,
                  numberFollowing: user.following,
                ),
                const SizedBox(height: 10),
                ExpandableText(text: user.bio),
                const SizedBox(height: 15),
                FollowOtherScreen(user: user), // ✅ تمرير المستخدم إلى FollowOtherScreen
                const SizedBox(height: 15),
              ],
            ),
          ),
          SizedBox(
            height: 500,
            child: ProfileScreeen(
              name: user.name,
              username: user.username ?? "Unknown", // ✅ تمرير اسم المستخدم الصحيح
              profileImage: user.imageUrl ?? "assets/images/default_user.jpeg", // ✅ تمرير صورة المستخدم
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
