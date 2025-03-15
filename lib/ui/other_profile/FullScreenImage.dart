
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:instgram_app/ui/other_profile/post_myAccount.dart';
import 'package:provider/provider.dart';
import 'package:instgram_app/ui/dark/theme_provider.dart';
import 'package:instgram_app/ui/widget/post_myAccount.dart';

class FullScreenImagefull extends StatelessWidget {
  final String username;
   final String name;  // ✅ استقبال اسم المستخدم الصحيح
  final String profileImage; // ✅ استقبال صورة الحساب الصحيحة
  final List<String> imagePaths;
  final List<String> descriptions;
  final int initialIndex;

  FullScreenImagefull({
    required this.username,
     required this.name,
    required this.profileImage, // ✅ تمرير صورة الحساب الصحيحة
    required this.imagePaths,
    required this.descriptions,
    this.initialIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.themeMode == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: isDarkMode ? Colors.white : Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          children: [
            Center(
              child: Text(
                username, // ✅ عرض اسم المستخدم الصحيح
                style: TextStyle(fontSize: 20, color: isDarkMode ? Colors.grey : Colors.black),
              ),
            ),
            Text(
              'Posts'.tr(),
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: isDarkMode ? Colors.white : Colors.black),
            ),
          ],
        ),
      ),
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        controller: PageController(initialPage: initialIndex),
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return Postss(
            name: name,
            username: username, // ✅ تمرير اسم المستخدم الصحيح
            profileImage: profileImage, // ✅ تمرير صورة الحساب الصحيحة
            imagePath: imagePaths[index],
            destext: descriptions[index],
          );
        },
      ),
    );
  }
}
