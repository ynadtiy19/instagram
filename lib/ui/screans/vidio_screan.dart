// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// class VideoFeedPage extends StatefulWidget {
//   @override
//   _VideoFeedPageState createState() => _VideoFeedPageState();
// }

// class _VideoFeedPageState extends State<VideoFeedPage> {
//   final List<String> videoPaths = [
//     'assets/videos/video1.mp4',
//     'assets/videos/video2.mp4',
//     'assets/videos/video3.mp4'
//   ];
//   PageController _pageController = PageController();
//   List<VideoPlayerController> _videoControllers = [];
//   Map<int, bool> likedVideos = {};

//   @override
//   void initState() {
//     super.initState();
//     _initializeVideos();
//     _loadLikes();
//   }

//   void _initializeVideos() {
//     for (var path in videoPaths) {
//       var controller = VideoPlayerController.asset(path)
//         ..initialize().then((_) {
//           setState(() {});
//         });
//       _videoControllers.add(controller);
//     }
//   }

//   Future<void> _loadLikes() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     for (int i = 0; i < videoPaths.length; i++) {
//       likedVideos[i] = prefs.getBool('liked_$i') ?? false;
//     }
//     setState(() {});
//   }

//   Future<void> _toggleLike(int index) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       likedVideos[index] = !(likedVideos[index] ?? false);
//     });
//     prefs.setBool('liked_$index', likedVideos[index]!);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: PageView.builder(
//         controller: _pageController,
//         scrollDirection: Axis.vertical,
//         itemCount: videoPaths.length,
//         onPageChanged: (index) {
//           for (var controller in _videoControllers) {
//             controller.pause();
//           }
//           _videoControllers[index].play();
//         },
//         itemBuilder: (context, index) {
//           return Stack(
//             alignment: Alignment.bottomRight,
//             children: [
//               Center(
//                 child: _videoControllers[index].value.isInitialized
//                     ? AspectRatio(
//                         aspectRatio: _videoControllers[index].value.aspectRatio,
//                         child: VideoPlayer(_videoControllers[index]),
//                       )
//                     : CircularProgressIndicator(),
//               ),
//               Positioned(
//                 right: 20,
//                 bottom: 50,
//                 child: IconButton(
//                   icon: Icon(
//                     likedVideos[index] == true ? Icons.favorite : Icons.favorite_border,
//                     color: likedVideos[index] == true ? Colors.red : Colors.white,
//                     size: 40,
//                   ),
//                   onPressed: () => _toggleLike(index),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     for (var controller in _videoControllers) {
//       controller.dispose();
//     }
//     super.dispose();
//   }
// }
//    'assets/vedio/WhatsApp Video 2025-03-04 at 1.02.23 AM (1).mp4',
//   'assets/vedio/WhatsApp Video 2025-03-04 at 1.02.23 AM.mp4',
//  'assets/vedio/WhatsApp Video 2025-03-04 at 1.02.24 AM.mp4'
///////////////////////////////////
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:instgram_app/ui/dark/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VideoFeedPage extends StatefulWidget {
  @override
  _VideoFeedPageState createState() => _VideoFeedPageState();
}

class _VideoFeedPageState extends State<VideoFeedPage> {
  final List<String> videoPaths = [
    'assets/vedio/WhatsApp Video 2025-03-04 at 1.02.23 AM (1).mp4',
    'assets/vedio/WhatsApp Video 2025-03-04 at 1.02.23 AM.mp4',
    'assets/vedio/WhatsApp Video 2025-03-04 at 1.02.24 AM.mp4'
  ];

  PageController _pageController = PageController();
  List<VideoPlayerController> _videoControllers = [];
  Map<int, bool> likedVideos = {};
  Map<int, int> likeCounts = {};
  Map<int, List<String>> comments = {};
  Map<int, int> shareCounts = {};

  @override
  void initState() {
    super.initState();
    _initializeVideos();
    _loadData();
  }

  void _initializeVideos() {
    for (var i = 0; i < videoPaths.length; i++) {
      var controller = VideoPlayerController.asset(videoPaths[i])
        ..initialize().then((_) {
          setState(() {}); // تحديث الواجهة بعد التهيئة
        }).catchError((error) {
          print(
              "خطأ في تحميل الفيديو: $error"); // طباعة الخطأ في حالة فشل التحميل
        })
        ..setLooping(true); // تكرار الفيديو

      _videoControllers.add(controller);
    }
  }

  Future<void> _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for (int i = 0; i < videoPaths.length; i++) {
      likedVideos[i] = prefs.getBool('liked_$i') ?? false;
      likeCounts[i] = prefs.getInt('like_count_$i') ?? 0;
      shareCounts[i] = prefs.getInt('share_count_$i') ?? 0;
      comments[i] = prefs.getStringList('comments_$i') ?? [];
    }
    setState(() {});
  }

  Future<void> _toggleLike(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      likedVideos[index] = !(likedVideos[index] ?? false);
      likeCounts[index] =
          likedVideos[index]! ? likeCounts[index]! + 1 : likeCounts[index]! - 1;
    });
    prefs.setBool('liked_$index', likedVideos[index]!);
    prefs.setInt('like_count_$index', likeCounts[index]!);
  }

  Future<void> _addComment(int index, String comment) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    comments[index] ??= [];
    comments[index]!.add(comment);
    prefs.setStringList('comments_$index', comments[index]!);
    setState(() {});
  }

  Future<void> _incrementShareCount(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      shareCounts[index] = (shareCounts[index]! + 1);
    });
    prefs.setInt('share_count_$index', shareCounts[index]!);
  }

  void _showCommentDialog(int index) {
    TextEditingController commentController = TextEditingController();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
          final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.themeMode == ThemeMode.dark;
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            padding: EdgeInsets.all(10),
            height: 400,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "Comments".tr(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: comments[index]?.length ?? 0,
                    itemBuilder: (context, i) {
                      return ListTile(
                        title: Text(comments[index]![i],
                            style: TextStyle(color: isDarkMode ? Colors.white : Colors.black)),
                      );
                    },
                  ),
                ),
                TextField(
                  controller: commentController,
                    style: TextStyle( color: isDarkMode ? Colors.black : Colors.white, fontSize: 20),
                  decoration: InputDecoration(
                    hintText: "Write a comment...".tr(),
                     hintStyle: TextStyle( color: isDarkMode ? Colors.black : Colors.white, fontSize: 20),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (commentController.text.isNotEmpty) {
                      _addComment(index, commentController.text);
                    }
                    Navigator.pop(context);
                  },
                  child: Text("Post" , style: TextStyle(color: isDarkMode ? Colors.white : Colors.black,fontSize: 20)).tr(),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
      final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.themeMode == ThemeMode.dark;
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        itemCount: videoPaths.length,
        onPageChanged: (index) {
          for (var controller in _videoControllers) {
            controller.pause(); // إيقاف جميع الفيديوهات
          }
          _videoControllers[index].play(); // تشغيل الفيديو الحالي
        },
        itemBuilder: (context, index) {
          return Stack(
            alignment: Alignment.bottomRight,
            children: [
              Center(
                child: _videoControllers[index].value.isInitialized
                    ? AspectRatio(
                        aspectRatio: _videoControllers[index].value.aspectRatio,
                        child: VideoPlayer(_videoControllers[index]),
                      )
                    : CircularProgressIndicator(), // عرض مؤشر تحميل أثناء التهيئة
              ),
              Positioned(
                right: 20,
                bottom: 50,
                child: Column(
                  children: [
                    IconButton(
                      icon: Icon(
                        likedVideos[index] == true
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: likedVideos[index] == true
                            ? Colors.red
                            : Colors.white,
                        size: 40,
                      ),
                      onPressed: () => _toggleLike(index),
                    ),
                    Text('${likeCounts[index]}',
                        style: TextStyle(color: Colors.white)),
                    SizedBox(height: 10),
                    IconButton(
                      icon: Icon(Icons.comment, color: Colors.white, size: 40),
                      onPressed: () => _showCommentDialog(index),
                    ),
                    Text('${comments[index]?.length ?? 0}',
                        style: TextStyle(color: Colors.white)),
                    SizedBox(height: 10),
                    IconButton(
                      icon: Icon(Icons.share, color: Colors.white, size: 40),
                      onPressed: () => _incrementShareCount(index),
                    ),
                    Text('${shareCounts[index]}',
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in _videoControllers) {
      controller.dispose(); // تحرير الذاكرة
    }
    super.dispose();
  }
}
