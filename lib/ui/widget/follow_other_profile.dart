// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:instgram_app/ui/dark/theme_provider.dart';
// import 'package:instgram_app/ui/widget/chatHamdy.dart';
// import 'package:provider/provider.dart';

// class FollowOtherScreen extends StatefulWidget {
//   const FollowOtherScreen({
//     super.key,
//   });

//   @override
//   State<FollowOtherScreen> createState() => _FollowOtherScreenState();
// }

// class _FollowOtherScreenState extends State<FollowOtherScreen> {
//   bool isFollowing = false;

//   void toggleFollow() {
//     setState(() {
//       isFollowing = !isFollowing;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context);
//     bool isDarkMode = themeProvider.themeMode == ThemeMode.dark;
//     return Column(
//       children: [
//         ElevatedButton(
//           onPressed: toggleFollow,
//           style: ElevatedButton.styleFrom(
//             fixedSize: Size(800, 20),
//             backgroundColor: isFollowing ? Colors.grey[300] : Colors.blue,
//             foregroundColor: isFollowing ? Colors.black : Colors.white,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(32),
//             ), // Rounded like the image
//           ),
//           child: Text(
//             isFollowing ? 'Unfollow'.tr() : 'Follow'.tr(),
//             style: TextStyle(fontSize: 24),
//           ),
//         ),
//         Row(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(5.0),
//               child: InkWell(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) {
//                         return ChatScreen(user: user);
//                       },
//                     ),
//                   );
//                 },
//                 child: Container(
//                   color: Colors.blueGrey,
//                   height: 40,
//                   width: 115,
//                   child: Center(
//                     child: Text(
//                       "Message".tr(),
//                       style: TextStyle(fontSize: 19),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(5.0),
//               child: InkWell(
//                 onTap: () {},
//                 child: Container(
//                   color: Colors.blueGrey,
//                   height: 40,
//                   width: 115,
//                   child: Center(
//                     child: Text(
//                       "Subscribe".tr(),
//                       style: TextStyle(fontSize: 19),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(5.0),
//               child: InkWell(
//                 onTap: () {},
//                 child: Container(
//                   color: Colors.blueGrey,
//                   height: 40,
//                   width: 115,
//                   child: Center(
//                     child: Text(
//                       "Contact".tr(),
//                       style: TextStyle(fontSize: 19),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(5.0),
//               child: InkWell(
//                 onTap: () {},
//                 child: Container(
//                   color: Colors.blueGrey,
//                   height: 30,
//                   width: 32,
//                   child: Center(
//                     child: Icon(Icons.add_reaction),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:instgram_app/data/testmodel.dart';
import 'package:instgram_app/ui/dark/theme_provider.dart';
import 'package:instgram_app/ui/widget/chatHamdy.dart'; // شاشة الدردشة
import 'package:provider/provider.dart';

class FollowOtherScreen extends StatefulWidget {
  final User user; // إضافة المستخدم

  const FollowOtherScreen({
    super.key,
    required this.user, // تمرير المستخدم عند إنشاء الصفحة
  });

  @override
  State<FollowOtherScreen> createState() => _FollowOtherScreenState();
}

class _FollowOtherScreenState extends State<FollowOtherScreen> {
  bool isFollowing = false;

  void toggleFollow() {
    setState(() {
      isFollowing = !isFollowing;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.themeMode == ThemeMode.dark;

    return Column(
      children: [
        ElevatedButton(
          onPressed: toggleFollow,
          style: ElevatedButton.styleFrom(
            fixedSize: Size(800, 40), // تكبير الزر قليلاً
            backgroundColor: isFollowing ? Colors.grey[300] : Colors.blue,
            foregroundColor: isFollowing ? Colors.black : Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            ),
          ),
          child: Text(
            isFollowing ? 'Unfollow'.tr() : 'Follow'.tr(),
            style: TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(height: 10), // إضافة مسافة بين الأزرار
        Row(
          mainAxisAlignment: MainAxisAlignment.center, // محاذاة الأزرار في المنتصف
          children: [
            _buildButton(
              text: "Message",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatScreen(user: widget.user), // تمرير المستخدم إلى الدردشة
                  ),
                );
              },
            ),
            _buildButton(text: "Subscribe", onTap: () {}),
            _buildButton(text: "Contact", onTap: () {}),
            _buildIconButton(icon: Icons.add_reaction, onTap: () {}),
          ],
        ),
      ],
    );
  }

  /// زر عام يستخدم في جميع الأزرار النصية
  Widget _buildButton({required String text, required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 40,
          width: 115,
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              text.tr(),
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  /// زر للأيقونات فقط
  Widget _buildIconButton({required IconData icon, required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Icon(icon, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
