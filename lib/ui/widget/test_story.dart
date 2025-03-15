// // import 'package:flutter/material.dart';
// // import 'package:instgram_app/data/sotry_list_modell.dart';
// // import 'package:instgram_app/ui/dark/theme_provider.dart';
// // import 'package:provider/provider.dart';

// // class StoryViewPage extends StatefulWidget {
// //   final SotryListModell story;

// //   const StoryViewPage({super.key, required this.story});

// //   @override
// //   _StoryViewPageState createState() => _StoryViewPageState();
// // }
// // class _StoryViewPageState extends State<StoryViewPage> {
// //   int currentIndex = 0;

// //   void nextImage() {
// //     if (currentIndex < widget.story.additionalImages.length) {
// //       setState(() {
// //         currentIndex++;
// //       });
// //     } else {
// //       Navigator.pop(context);
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     // احصل على حالة الوضع الداكن من `ThemeProvider`
// //     final themeProvider = Provider.of<ThemeProvider>(context);
// //     bool isDarkMode = themeProvider.themeMode == ThemeMode.dark;

// //     return Scaffold(
// //       backgroundColor: isDarkMode ? Colors.black : Colors.white, // تم تصحيح الخطأ هنا
// //       body: GestureDetector(
// //         onTap: nextImage,
// //         child: Stack(
// //           children: [
// //             Center(
// //               child: Image.asset(
// //                 currentIndex == 0
// //                     ? widget.story.image
// //                     : (widget.story.additionalImages[currentIndex - 1].image ?? widget.story.image),
// //                 fit: BoxFit.cover,
// //                 width: double.infinity,
// //                 height: 700,
// //               ),
// //             ),
// //             Positioned(
// //               top: 40,
// //               left: 10,
// //               child: IconButton(
// //                 icon: Icon(Icons.close, color: Colors.white, size: 30),
// //                 onPressed: () => Navigator.pop(context),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:instgram_app/data/sotry_list_modell.dart';
// import 'package:instgram_app/ui/dark/theme_provider.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class StoryViewPage extends StatefulWidget {
//   final SotryListModell story;

//   const StoryViewPage({super.key, required this.story});

//   @override
//   _StoryViewPageState createState() => _StoryViewPageState();
// }

// class _StoryViewPageState extends State<StoryViewPage> {
//   int currentIndex = 0;
//   Map<String, bool> likes = {};
//   Map<String, List<String>> comments = {};
//   TextEditingController commentController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     loadLikesAndComments();
//   }

//   Future<void> loadLikesAndComments() async {
//     final prefs = await SharedPreferences.getInstance();
//     setState(() {
//       likes = {
//         for (var img in getAllImages()) img: prefs.getBool("like_$img") ?? false
//       };
//       comments = {
//         for (var img in getAllImages()) img: prefs.getStringList("comments_$img") ?? []
//       };
//     });
//   }

//   Future<void> saveLike(String image, bool isLiked) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setBool("like_$image", isLiked);
//   }

//   Future<void> saveComment(String image, String comment) async {
//     final prefs = await SharedPreferences.getInstance();
//     comments[image]?.add(comment);
//     await prefs.setStringList("comments_$image", comments[image]!);
//     setState(() {});
//   }

//   void nextImage() {
//     if (currentIndex < widget.story.additionalImages.length) {
//       setState(() {
//         currentIndex++;
//       });
//     } else {
//       Navigator.pop(context);
//     }
//   }

//   List<String> getAllImages() {
//     return [
//       widget.story.image,
//       ...widget.story.additionalImages.map((img) => img.image)
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context);
//     bool isDarkMode = themeProvider.themeMode == ThemeMode.dark;
//     String currentImage = currentIndex == 0
//         ? widget.story.image
//         : widget.story.additionalImages[currentIndex - 1].image;

//     return Scaffold(
//       backgroundColor: isDarkMode ? Colors.black : Colors.blue,
//       body: Stack(
//         children: [
//           GestureDetector(
//             onTap: nextImage,
//             child: Center(
//               child: Image.asset(
//                 currentImage,
//                 fit: BoxFit.cover,
//                 width: double.infinity,
//                 height: 700,
//               ),
//             ),
//           ),
//           Positioned(
//             top: 40,
//             left: 10,
//             child: IconButton(
//               icon: Icon(Icons.close, color: Colors.white, size: 30),
//               onPressed: () => Navigator.pop(context),
//             ),
//           ),
//           Positioned(
//             top: 50,
//             left: 60,
//             child: Text(
//               widget.story.Text,
//               style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
//             ),
//           ),
//           Positioned(
//             bottom: 50,
//             left: 20,
//             child: Row(
//               children: [
//                 IconButton(
//                   icon: Icon(
//                     likes[currentImage] == true ? Icons.favorite : Icons.favorite_border,
//                     color: likes[currentImage] == true ? Colors.red : Colors.white,
//                   ),
//                   onPressed: () {
//                     setState(() {
//                       likes[currentImage] = !(likes[currentImage] ?? false);
//                       saveLike(currentImage, likes[currentImage]!);
//                     });
//                   },
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.comment, color: Colors.white),
//                   onPressed: () {
//                     showModalBottomSheet(
//                       context: context,
//                       builder: (context) {
//                         return Container(
//                           padding: EdgeInsets.all(10),
//                           child: Column(
//                             children: [
//                               Expanded(
//                                 child: ListView.builder(
//                                   itemCount: comments[currentImage]?.length ?? 0,
//                                   itemBuilder: (context, index) {
//                                     return ListTile(
//                                       title: Text(
//                                         comments[currentImage]![index],
//                                         style: TextStyle(color: Colors.black),
//                                       ),
//                                     );
//                                   },
//                                 ),
//                               ),
//                               TextField(
//                                 controller: commentController,
//                                 decoration: InputDecoration(
//                                   hintText: "اكتب تعليق...",
//                                   filled: true,
//                                   fillColor: Colors.white,
//                                   suffixIcon: IconButton(
//                                     icon: Icon(Icons.send),
//                                     onPressed: () {
//                                       if (commentController.text.isNotEmpty) {
//                                         saveComment(currentImage, commentController.text);
//                                         commentController.clear();
//                                       }
//                                       Navigator.pop(context);
//                                     },
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:instgram_app/data/sotry_list_modell.dart';
import 'package:instgram_app/ui/dark/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StoryViewPage extends StatefulWidget {
  final SotryListModell story;

  const StoryViewPage({super.key, required this.story});

  @override
  _StoryViewPageState createState() => _StoryViewPageState();
}

class _StoryViewPageState extends State<StoryViewPage> {
  int currentIndex = 0;
  Map<String, bool> likes = {};
  Map<String, List<String>> comments = {};
  TextEditingController commentController = TextEditingController();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    loadLikesAndComments();
    startAutoPlay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startAutoPlay() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (mounted) {
        nextImage();
      }
    });
  }

  void stopAutoPlay() {
    _timer?.cancel();
  }

  Future<void> loadLikesAndComments() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      likes = {
        for (var img in getAllImages()) img: prefs.getBool("like_$img") ?? false
      };
      comments = {
        for (var img in getAllImages())
          img: prefs.getStringList("comments_$img") ?? []
      };
    });
  }

  Future<void> saveLike(String image, bool isLiked) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("like_$image", isLiked);
  }

  Future<void> saveComment(String image, String comment) async {
    final prefs = await SharedPreferences.getInstance();
    comments[image]?.add(comment);
    await prefs.setStringList("comments_$image", comments[image]!);
    setState(() {});
  }

  void nextImage() {
    if (currentIndex < widget.story.additionalImages.length) {
      setState(() {
        currentIndex++;
      });
    } else {
      Navigator.pop(context);
    }
  }

  List<String> getAllImages() {
    return [
      widget.story.image,
      ...widget.story.additionalImages.map((img) => img.image)
    ];
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.themeMode == ThemeMode.dark;
    String currentImage = currentIndex == 0
        ? widget.story.image
        : widget.story.additionalImages[currentIndex - 1].image;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.blue,
      body: Stack(
        children: [
          GestureDetector(
            onTap: nextImage,
            child: Center(
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(opacity: animation, child: child);
                },
                child: Image.asset(
                  currentImage,
                  key: ValueKey<String>(currentImage),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 700,
                ),
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 10,
            child: IconButton(
              icon: Icon(Icons.close, color: Colors.white, size: 30),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          Positioned(
            top: 50,
            left: 60,
            child: Text(
              widget.story.Text,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 20,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    likes[currentImage] == true
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color:
                        likes[currentImage] == true ? Colors.red : Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      likes[currentImage] = !(likes[currentImage] ?? false);
                      saveLike(currentImage, likes[currentImage]!);
                    });
                  },
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.comment, color: Colors.white),
                      onPressed: () {
                        stopAutoPlay();
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: Text(
                                      "Comments".tr(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Expanded(
                                    child: ListView.builder(
                                      itemCount:
                                          comments[currentImage]?.length ?? 0,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          title: Text(
                                            comments[currentImage]![index],
                                            style: TextStyle(
                                                color: isDarkMode
                                                    ? Colors.white
                                                    : Colors.black),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  TextField(
                                    controller: commentController,
                                    style: TextStyle(
                                        color: isDarkMode
                                            ? Colors.black
                                            : Colors.white,
                                        fontSize: 20),
                                    decoration: InputDecoration(
                                      hintText: "Write a comment...".tr(),
                                      hintStyle: TextStyle(
                                          color: isDarkMode
                                              ? Colors.black
                                              : Colors.white,
                                          fontSize: 20),
                                      filled: true,
                                      fillColor: Colors.white,
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          Icons.send,
                                          color: isDarkMode
                                              ? Colors.black
                                              : Colors.white,
                                        ),
                                        onPressed: () {
                                          if (commentController.text.isNotEmpty) {
                                            saveComment(currentImage, commentController.text);
                                            commentController.clear();
                                          }
                                          Navigator.pop(context);
                                          startAutoPlay();
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ).whenComplete(() => startAutoPlay());
                      },
                    ),
                    Text(
                      "${comments[currentImage]?.length ?? 0}",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}