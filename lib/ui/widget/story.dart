// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:instgram_app/data/sotry_list_modell.dart';
// import 'package:instgram_app/ui/dark/theme_provider.dart' show ThemeProvider;
// import 'package:provider/provider.dart';

// class Story extends StatelessWidget {
//   Story({super.key, required this.modell});
//   SotryListModell modell;

//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context);
//     bool isDarkMode = themeProvider.themeMode == ThemeMode.dark;
//     return Row(
//       children: [
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 gradient: LinearGradient(
//                   colors: [
//                     Colors.yellow,
//                     Colors.orange,
//                     Colors.red,
//                     Colors.purple
//                   ],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//               ),
//               padding: EdgeInsets.all(3), // Border thickness
//               child: CircleAvatar(
//                 radius: 45,
//                 backgroundColor: Colors.white, // Inner white border
//                 child: CircleAvatar(
//                   radius: 44, // Slightly smaller to fit inside the gradient
//                   backgroundImage: AssetImage(modell.image),
//                 ),
//               ),
//             ),
//             Text(
//               modell.Text.tr(),
//               style: TextStyle(
//                 fontSize: 18,
//                 color: isDarkMode ? Colors.white : Colors.black,
//               ),
//             ),
//           ],
//         ),
//         // Column(
//         //               children: [
//         //                 Stack(
//         //                   children: [
//         //                     Container(
//         //                       decoration: BoxDecoration(
//         //                         shape: BoxShape.circle,
//         //                         gradient: LinearGradient(
//         //                           colors: [Colors.yellow, Colors.orange, Colors.red, Colors.purple],
//         //                           begin: Alignment.topLeft,
//         //                           end: Alignment.bottomRight,
//         //                         ),
//         //                       ),
//         //                       padding: EdgeInsets.all(3), // Border thickness
//         //                       child: CircleAvatar(
//         //                         radius: 32,
//         //                         backgroundColor: Colors.white, // Inner white border
//         //                         child: CircleAvatar(
//         //                           radius: 29, // Slightly smaller to fit inside the gradient
//         //                           backgroundImage: AssetImage('modell.image'),
//         //                         ),
//         //                       ),
//         //                     ),
//         // Positioned(
//         //   bottom: 0,
//         //   right: 0,
//         //   child: Container(
//         //     decoration: BoxDecoration(
//         //       color: Colors.blue,
//         //       shape: BoxShape.circle,
//         //       border: Border.all(color: Colors.black, width: 2), // Border to separate it from profile pic
//         //     ),
//         //     padding: EdgeInsets.all(4), // Adjust size
//         //     child: Icon(
//         //       Icons.add,
//         //       color: Colors.white,
//         //       size: 18, // Adjust icon size
//         //     ),
//         //   ),
//         // ),
//         //                   ],
//         //                 ),
//         //                 SizedBox(height: 10,),
//         //                Text(
//         //       modell.Text.tr(),
//         //       style: TextStyle(
//         //         fontSize: 18,
//         //         color: isDarkMode ? Colors.white : Colors.black,
//         //       ),
//         //     ),
//         //               ],
//         //             ),
//         SizedBox(
//           width: 10,
//         )
//       ],
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:instgram_app/data/sotry_list_modell.dart';
// import 'package:instgram_app/ui/dark/theme_provider.dart';
// import 'package:provider/provider.dart';

// class Story extends StatelessWidget {
//   final SotryListModell modell;
  
//   const Story({super.key, required this.modell});

//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context);
//     bool isDarkMode = themeProvider.themeMode == ThemeMode.dark;

//     return GestureDetector(
//       onTap: () => showStory(context, modell),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               gradient: LinearGradient(
//                 colors: [Colors.yellow, Colors.orange, Colors.red, Colors.purple],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//             ),
//             padding: const EdgeInsets.all(3),
//             child: CircleAvatar(
//               radius: 45,
//               backgroundColor: Colors.white,
//               child: CircleAvatar(
//                 radius: 44,
//                 backgroundImage: AssetImage(modell.image ?? 'assets/default_image.png'),
//               ),
//             ),
//           ),
//           Text(
//             modell.Text ?? 'Unknown',
//             style: TextStyle(
//               fontSize: 18,
//               color: isDarkMode ? Colors.white : Colors.black,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// void showStory(BuildContext context, SotryListModell story) {
//   int currentIndex = 0;

//   showDialog(
//     context: context,
//     builder: (context) {
//       return StatefulBuilder(
//         builder: (context, setState) {
//           return GestureDetector(
//             onTap: () {
//               if (currentIndex < story.additionalImages.length) {
//                 setState(() {
//                   currentIndex++;
//                 });
//               } else {
//                 Navigator.pop(context);
//               }
//             },
//             child: Dialog(
//               backgroundColor: Colors.black,
//               child: Image.asset(
//                 currentIndex == 0
//                     ? story.image
//                     : (story.additionalImages[currentIndex - 1].image ?? story.image),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           );
//         },
//       );
//     },
//   );
// }


import 'package:flutter/material.dart';
import 'package:instgram_app/data/sotry_list_modell.dart';
import 'package:instgram_app/ui/dark/theme_provider.dart';
import 'package:instgram_app/ui/widget/test_story.dart';
import 'package:provider/provider.dart';

class Story extends StatelessWidget {
  final SotryListModell modell;

  const Story({super.key, required this.modell});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.themeMode == ThemeMode.dark;

    return GestureDetector(
      onTap: () => _showStory(context, modell), // استخدم الدالة بعد تعريفها
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             SizedBox(
            width: 10,
          ),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Colors.yellow, Colors.orange, Colors.red, Colors.purple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              padding: const EdgeInsets.all(3),
              child: CircleAvatar(
                radius: 45,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 44,
                  backgroundImage: AssetImage(modell.image ?? 'assets/default_image.png'),
                ),
              ),
            ),
            Text(
              modell.Text ?? 'Unknown',
              style: TextStyle(
                fontSize: 18,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
           
          ],
        ),
      ),
    );
  }

  void _showStory(BuildContext context, SotryListModell story) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StoryViewPage(story: story),
      ),
    );
  }
}
