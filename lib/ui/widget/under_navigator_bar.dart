// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:instgram_app/ui/widget/Post_follows_following.dart';

// class UnderNavigatorBar extends StatelessWidget {
//   UnderNavigatorBar({
//     super.key,
//     required this.imagee,
//     required this.name,
//     required this.numberPosts,
//     required this.numberFollowers,
//     required this.numberFollowing,
//   });

//   String name;
//   String imagee;
//   int numberPosts;
//   int numberFollowers;
//   int numberFollowing;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         CircleAvatar(
//           radius: 60,
//           backgroundImage: AssetImage('$imagee'),
//         ),
//         SizedBox(
//           width: 10,
//         ),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               '$name',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//             ),
//             Row(
//               children: [
//                 PostFollowsFollowing(
//                   numbers: numberPosts,
//                   name: 'Posts'.tr(),
//                 ),
//                 SizedBox(
//                   width: 25,
//                 ),
//                 PostFollowsFollowing(
//                   numbers: numberFollowers,
//                   name: 'followers'.tr(),
//                 ),
//                 SizedBox(
//                   width: 25,
//                 ),
//                 PostFollowsFollowing(
//                   numbers: numberFollowing,
//                   name: 'following'.tr(),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:instgram_app/ui/widget/Post_follows_following.dart';
import 'package:provider/provider.dart';
import 'package:instgram_app/ui/dark/theme_provider.dart';

class UnderNavigatorBar extends StatelessWidget {
  const UnderNavigatorBar({
    super.key,
    required this.imagee,
    required this.name,
    required this.numberPosts,
    required this.numberFollowers,
    required this.numberFollowing,
  });

  final String name;
  final String imagee;
  final int numberPosts;
  final int numberFollowers;
  final int numberFollowing;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.themeMode == ThemeMode.dark;

    return Row(
      children: [
        CircleAvatar(
          radius: 60,
          backgroundImage: AssetImage(imagee),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Colors.black, // تغيير لون النصوص
              ),
            ),
            Row(
              children: [
                PostFollowsFollowing(
                  numbers: numberPosts,
                  name: 'Posts'.tr(),
                ),
                const SizedBox(width: 25),
                PostFollowsFollowing(
                  numbers: numberFollowers,
                  name: 'followers'.tr(),
                ),
                const SizedBox(width: 25),
                PostFollowsFollowing(
                  numbers: numberFollowing,
                  name: 'following'.tr(),
                ),
              ],
            ),
           
          ],
        ),
      ],
    );
  }
}
