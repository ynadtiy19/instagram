
import 'package:flutter/material.dart';
import 'package:instgram_app/ui/other_profile/ImageGrid.dart';

class ProfileScreeen extends StatelessWidget {
  final String username; // ✅ استقبال اسم المستخدم الصحيح
   final String name; 
  final String profileImage; // ✅ استقبال صورة الحساب الصحيحة
  final List<String> photosImages;
  final List<String> photosDescriptions;
  final List<String> videosImages;
  final List<String> videosDescriptions;

  ProfileScreeen({
    required this.username, // ✅ تمرير اسم المستخدم الصحيح
   required this.name,
    required this.profileImage, // ✅ تمرير صورة الحساب الصحيحة
    required this.photosImages,
    required this.photosDescriptions,
    required this.videosImages,
    required this.videosDescriptions,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            indicatorColor: Colors.blue,
            tabs: [
              Tab(icon: Icon(Icons.grid_on)),
              Tab(icon: Icon(Icons.video_collection)),
              Tab(icon: Icon(Icons.assignment_ind_outlined)),
            ],
          ),
          SizedBox(height: 10),
          Expanded(
            child: TabBarView(
              children: [
                ImageGgrid(
                  name: name,
                  username: username, // ✅ تمرير اسم المستخدم الصحيح
                  profileImage: profileImage, // ✅ تمرير صورة الحساب الصحيحة
                  images: photosImages,
                  desctext: photosDescriptions,
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Share a moment with the world",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Create Your first Reel",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
                ImageGgrid(
                   name: name,
                  username: username, // ✅ تمرير اسم المستخدم الصحيح
                  profileImage: profileImage, // ✅ تمرير صورة الحساب الصحيحة
                  images: videosImages,
                  desctext: videosDescriptions,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
