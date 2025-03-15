
import 'package:flutter/material.dart';
import 'package:instgram_app/ui/other_profile/FullScreenImage.dart';

class ImageGgrid extends StatelessWidget {
  final String username; 
  final String name;// ✅ استقبال اسم المستخدم الصحيح
  final String profileImage; // ✅ استقبال صورة الحساب الصحيحة
  final List<String> images;
  final List<String> desctext;

  ImageGgrid({
    required this.username,
     required this.name,
    required this.profileImage, // ✅ استقبال صورة الحساب الصحيحة
    required this.images,
    required this.desctext,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(5),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      itemCount: images.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FullScreenImagefull(
                  name: name,
                  username: username, // ✅ تمرير اسم المستخدم الصحيح
                  profileImage: profileImage, // ✅ تمرير صورة الحساب الصحيحة
                  imagePaths: images,
                  descriptions: desctext,
                  initialIndex: index,
                ),
              ),
            );
          },
          child: Image.asset(images[index], fit: BoxFit.cover),
        );
      },
    );
  }
}
