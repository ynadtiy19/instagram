// import 'package:flutter/material.dart';
// import 'package:instgram_app/ui/widget/ImageGrid.dart';

// class ProfileScreen extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3, // Three tabs (Grid, Video, Tagged)
//       child: Column(
//         children: [
//           // Tabs for Grid, Video, and Tagged
//           TabBar(
//             indicatorColor: Colors.blue,
//             tabs: [
//               Tab(icon: Icon(Icons.grid_on)), // Grid Icon
//               Tab(icon: Icon(Icons.video_collection)), // Video Icon
//               Tab(icon: Icon(Icons.assignment_ind_outlined)), // Tagged Icon
//             ],
//           ),

//           SizedBox(height: 10),

//           // GridView Changing Based on Tab Selection
//           Expanded(
//             child: TabBarView(
//               children: [
//                 // First Grid (Photos)
//                 ImageGrid(
//                   images: [
//                       "assets/images/mohamed1.jpeg",
//                     "assets/images/mohamed2.jpeg",
//                     "assets/images/mohamed3.jpeg",
//                     "assets/images/mohamed4.jpeg",
//                     "assets/images/mohamed5.jpeg",
//                     "assets/images/mohamed6.jpeg",
//                     "assets/images/mohamed7.jpeg",
//                     "assets/images/mohamed8.jpeg",
//                     "assets/images/mohamed9.jpeg",
//                     "assets/images/mohamed10.jpeg",
//                     "assets/images/mohamed11.jpeg",
//                     "assets/images/Graduation.jpeg",
//                     "assets/images/elmontaza.jpeg",
//                   ],
//                   desctext: [
//                     'blurry lights. deep mind✨🖤',
//                     'Beauty isn’t about pictures, it’s about who’s looking 🖤✨️',
//                     '🖤✨',
//                     'Gentle as usual✨🖤',
//                     'I don’t sweat, I sparkle✨',
//                     'A break ',
//                     'Think positive, live positive💭❤️‍🔥✨',
//                     'If it was easy, everyone would do it 🖤✨',
//                     '🧿👑',
//                     'We have dreams that have embraced the clouds of the sky🖤✨',
//                     '🖤🔥',
//                       '1st🥇✨',
//                     'officially graduated🖤✨',
//                       'Eid Mubarak🖤✨',
//                   ],
//                 ),

//                 // Message for Reels
//                 Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "Share a moment with the world",
//                         style: TextStyle(
//                           fontSize: 25,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text(
//                         "Create Your first Reel",
//                         style: TextStyle(
//                           fontSize: 20,
//                           color: Colors.blue,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 // Second Grid (Videos)
//                 ImageGrid(
//                   images: [
//                     "assets/images/WhatsApp Image 2025-02-12 at 5.36.25 PM (1).jpeg",
//                     "assets/images/WhatsApp Image 2025-02-12 at 5.36.25 PM.jpeg",
//                     "assets/images/WhatsApp Image 2025-02-12 at 5.36.26 PM (1).jpeg",
//                    'assets/images/MyMother.jpeg',
//                     "assets/images/WhatsApp Image 2025-02-12 at 5.36.26 PM (4).jpeg",
//                     "assets/images/WhatsApp Image 2025-02-12 at 5.36.26 PM.jpeg",
//                     "assets/images/WhatsApp Image 2025-02-12 at 5.36.27 PM (2).jpeg",

//                     "assets/images/WhatsApp Image 2025-02-12 at 5.36.27 PM.jpeg",
//                     "assets/images/mohamed10.jpeg",
//                     "assets/images/mohamed11.jpeg",
//                     "assets/images/Graduation.jpeg",
//                     "assets/images/elmontaza.jpeg",

//                   ],
//                   desctext: [
//                     'Mybro',
//                     '',
//                     'Mybro',
//                     '',
//                     'Mybro',
//                     '',
//                     'Mybro',
//                     'Mybro',
//                     '',
//                     '',
//                     '',
//                     '',
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:instgram_app/ui/widget/ImageGrid.dart';

class ProfileScreen extends StatelessWidget {
  final List<String> photosImages;
  final List<String> photosDescriptions;
  final List<String> videosImages;
  final List<String> videosDescriptions;

  ProfileScreen({
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
                ImageGrid(
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
                ImageGrid(
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
