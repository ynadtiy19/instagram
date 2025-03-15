import 'package:flutter/material.dart';
import 'package:instgram_app/data/postHomepagemodel.dart';
import 'package:instgram_app/ui/widget/posts.dart';

class Postlisthomepage extends StatelessWidget {
   Postlisthomepage({super.key});
 final List<Post> posts = [
  Post(
    textname: 'mohamed_Eltrasy',
    imageaccount: 'assets/images/WhatsApp Image 2025-02-12 at 5.36.27 PM.jpeg',
    imagePath: 'assets/images/WhatsApp Image 2025-02-12 at 5.36.27 PM.jpeg',
    destext: '✨🖤',
    likes: 440,
    isLiked: false,
  ),
  Post(
    textname:'hamdy_mostafa',
    imageaccount: 'assets/images/WhatsApp Image 2025-02-12 at 5.36.25 PM.jpeg',
    imagePath:  'assets/images/WhatsApp Image 2025-02-12 at 5.36.25 PM.jpeg',
    destext: ' 🖤✨️',
    likes: 110,
    isLiked: true,
  ),
    Post(
    textname:'hamdy_mostafa',
    imageaccount:'assets/images/WhatsApp Image 2025-02-12 at 5.36.25 PM.jpeg',
    imagePath: 'assets/images/images.jpg',
    destext: ' 🖤✨️',
    likes: 550,
    isLiked: false,
  ),
    Post(
    textname:'tarek_elansary',
    imageaccount: 'assets/images/WhatsApp Image 2025-02-12 at 5.36.26 PM.jpeg',
    imagePath: 'assets/images/download.jpg',
    destext: ' 🖤✨️',
    likes: 60,
    isLiked: true,
  ),

];
  @override
  Widget build(BuildContext context) {
    return SizedBox(height:650,
      child: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
      return PostsHomePage(post: posts[index]);
        },
      ),
    );
  }
}