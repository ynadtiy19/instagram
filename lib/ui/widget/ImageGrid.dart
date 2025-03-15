// import 'package:flutter/material.dart';
// import 'package:instgram_app/ui/widget/FullScreenImage.dart';

// class ImageGrid extends StatelessWidget {
//   final List<String> images;
//   final List<String> desctext;

//   ImageGrid({required this.images, required this.desctext});

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       padding: EdgeInsets.all(5),
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 3, // 3 columns like Instagram
//         crossAxisSpacing: 5,
//         mainAxisSpacing: 5,
//       ),
//       itemCount: images.length,
//       itemBuilder: (context, index) {
//         return GestureDetector(
//           onTap: () {
//             // Navigate to FullScreenImage with the list of images and descriptions
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => FullScreenImage(
//                   imagePaths: images,
//                   descriptions: desctext,
//                   initialIndex: index, // Start at the tapped image
//                 ),
//               ),
//             );
//           },
//           child: Image.asset(images[index], fit: BoxFit.cover),
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:instgram_app/ui/widget/FullScreenImage.dart';

class ImageGrid extends StatelessWidget {
  final List<String> images;
  final List<String> desctext;

  ImageGrid({required this.images, required this.desctext});

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
                builder: (context) => FullScreenImage(
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
