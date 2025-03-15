// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:instgram_app/data/postHomepagemodel.dart';
// import 'package:instgram_app/ui/dark/theme_provider.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class PostsHomePage extends StatefulWidget {
//   final Post post; // Use the Post model

//   PostsHomePage({super.key, required this.post});

//   @override
//   State<PostsHomePage> createState() => _PostsState();
// }

// class _PostsState extends State<PostsHomePage> {
//   @override
//   void initState() {
//     super.initState();
//     _loadLikeData();
//   }

//   // Load saved like count and state for THIS specific image
//   Future<void> _loadLikeData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       widget.post.likes = prefs.getInt('${widget.post.imagePath}_like_count') ?? 0;
//       widget.post.isLiked = prefs.getBool('${widget.post.imagePath}_is_liked') ?? false;
//     });
//   }

//   // Save like count and state for THIS specific image
//   Future<void> _saveLikeData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setInt('${widget.post.imagePath}_like_count', widget.post.likes);
//    // prefs.setBool('${widget.post.imageaccount}_is_liked', widget.post.isLiked);
//   }

//   void _toggleLike() {
//     setState(() {
//       if (widget.post.isLiked) {
//         if (widget.post.likes > 0) widget.post.likes--; // Prevent likes from going below zero
//       } else {
//         widget.post.likes++;
//       }
//       widget.post.isLiked = !widget.post.isLiked;
//     });
//     _saveLikeData(); // Save the state for this specific image
//   }

//   @override
//   Widget build(BuildContext context) {
//                final themeProvider = Provider.of<ThemeProvider>(context);
//     bool isDarkMode = themeProvider.themeMode == ThemeMode.dark;
//     return Padding(
//       padding: const EdgeInsets.only(top: 20),
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10),
//             child: Row(
//               children: [
//                 CircleAvatar(
//                   radius: 20,
//                   backgroundImage: AssetImage(widget.post.imageaccount),
//                 ),
//                 SizedBox(width: 10),
//                 Text(
//                   widget.post.textname, // Use the Post model's text1
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                    color: isDarkMode ? Colors.white : Colors.black,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 10),
//           Image.asset(widget.post.imagePath, fit: BoxFit.fill), // Use the Post model's imagePath
//           SizedBox(height: 10),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10),
//             child: Column(
//               children: [
//                 SizedBox(height: 10),
//                 Row(
//                   children: [
//                     IconButton(
//                       icon: Icon(
//                         widget.post.isLiked ? Icons.favorite : Icons.favorite_border,
//                         color: widget.post.isLiked ? Colors.red : Colors.grey,
//                         size: 30,
//                       ),
//                       onPressed: _toggleLike,
//                     ),
//                     Text(
//                        "${widget.post.likes} ${'Likes'.tr()}",
//                       style: TextStyle( color: isDarkMode ? Colors.white : Colors.black, fontSize: 18),
//                     ),
//                     IconButton(
//                       onPressed: () {},
//                       icon: Icon(
//                         Icons.insert_comment,
//                         size: 28,
//                       ),
//                     ),
//                     IconButton(
//                       onPressed: () {},
//                       icon: Icon(
//                         Icons.share,
//                         size: 28,
//                       ),
//                     ),
//                     Spacer(),
//                     IconButton(
//                       onPressed: () {},
//                       icon: Icon(
//                         Icons.save,
//                         size: 28,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10),
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       widget.post.textname,
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: isDarkMode ? Colors.white : Colors.black,
//                       ),
//                     ),
//                     SizedBox(width: 10),
//                     Expanded(
//                       child: Text(
//                         widget.post.destext, // Use the Post model's destext
//                         style: TextStyle(fontSize: 18),
//                         softWrap: true,
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     )
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 10),
//           Divider(color: Colors.grey, endIndent: 20, indent: 20),
//           SizedBox(height: 10),
//         ],
//       ),
//     );
//   }
// }


// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:instgram_app/data/postHomepagemodel.dart';
// import 'package:instgram_app/ui/dark/theme_provider.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class PostsHomePage extends StatefulWidget {
//   final Post post;

//   const PostsHomePage({super.key, required this.post});

//   @override
//   State<PostsHomePage> createState() => _PostsState();
// }

// class _PostsState extends State<PostsHomePage> {
//   List<Map<String, dynamic>> comments = [];
//   final TextEditingController commentController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _loadLikeData();
//     _loadComments();
//   }

//   Future<void> _loadLikeData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       widget.post.likes = prefs.getInt('${widget.post.imagePath}_like_count') ?? 0;
//       widget.post.isLiked = prefs.getBool('${widget.post.imagePath}_is_liked') ?? false;
//     });
//   }

//   Future<void> _saveLikeData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setInt('${widget.post.imagePath}_like_count', widget.post.likes);
//     await prefs.setBool('${widget.post.imagePath}_is_liked', widget.post.isLiked);
//   }

//   void _toggleLike() {
//     setState(() {
//       if (widget.post.isLiked) {
//         if (widget.post.likes > 0) widget.post.likes--;
//       } else {
//         widget.post.likes++;
//       }
//       widget.post.isLiked = !widget.post.isLiked;
//     });
//     _saveLikeData();
//   }

//   Future<void> _loadComments() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     List<String>? storedComments = prefs.getStringList('${widget.post.imagePath}_comments');
//     setState(() {
//       comments = storedComments?.map((comment) {
//         List<String> parts = comment.split('::');
//         return {'text': parts[0], 'likes': int.parse(parts[1])};
//       }).toList() ?? [];
//       comments.sort((a, b) => b['likes'].compareTo(a['likes']));
//     });
//   }

//   Future<void> _saveComments() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     List<String> commentStrings = comments.map((c) => '${c['text']}::${c['likes']}').toList();
//     await prefs.setStringList('${widget.post.imagePath}_comments', commentStrings);
//   }

//   void _addComment(String text) {
//     if (text.trim().isEmpty) return; // Avoid adding empty comments
//     setState(() {
//       comments.add({'text': text, 'likes': 0});
//     });
//     _saveComments();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context);
//     final bool isDarkMode = themeProvider.themeMode == ThemeMode.dark;

//     return Padding(
//       padding: const EdgeInsets.only(top: 20),
//       child: Column(
//         children: [
//           // User Info Row
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10),
//             child: Row(
//               children: [
//                 CircleAvatar(
//                   radius: 20,
//                   backgroundImage: AssetImage(widget.post.imageaccount),
//                 ),
//                 const SizedBox(width: 10),
//                 Text(
//                   widget.post.textname,
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: isDarkMode ? Colors.white : Colors.black,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 10),

//           // Post Image
//           Image.asset(widget.post.imagePath, fit: BoxFit.fill),
//           const SizedBox(height: 10),

//           // Like, Comment, Share, Save Buttons
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10),
//             child: Column(
//               children: [
//                 const SizedBox(height: 10),
//                 Row(
//                   children: [
//                     // Like Button
//                     IconButton(
//                       icon: Icon(
//                         widget.post.isLiked ? Icons.favorite : Icons.favorite_border,
//                         color: widget.post.isLiked ? Colors.red : Colors.grey,
//                         size: 30,
//                       ),
//                       onPressed: _toggleLike,
//                     ),
//                     Text(
//                       "${widget.post.likes} ${'Likes'.tr()}",
//                       style: TextStyle(
//                         color: isDarkMode ? Colors.white : Colors.black,
//                         fontSize: 18,
//                       ),
//                     ),

//                     // Comment Button
//                     IconButton(
//                       onPressed: () {
//                         showModalBottomSheet(
//                           context: context,
//                           builder: (context) {
//                             return Container(
//                               padding: const EdgeInsets.all(10),
//                               child: Column(
//                                 children: [
//                                   // Comments List
//                                   Expanded(
//                                     child: ListView.builder(
//                                       itemCount: comments.length,
//                                       itemBuilder: (context, index) {
//                                         return ListTile(
//                                           title: Text(
//                                             comments[index]['text'],
//                                             style: TextStyle(
//                                               color: isDarkMode ? Colors.white : Colors.black,
//                                             ),
//                                           ),
//                                         );
//                                       },
//                                     ),
//                                   ),

//                                   // Comment Input Field
//                                   TextField(
//                                     controller: commentController,
//                                     decoration: InputDecoration(
//                                       hintText: "Write a comment...".tr(),
//                                       filled: true,
//                                       fillColor: isDarkMode ? Colors.grey[800] : Colors.grey[200],
//                                       suffixIcon: IconButton(
//                                         icon: Icon(Icons.send, color: isDarkMode ? Colors.white : Colors.black),
//                                         onPressed: () {
//                                           if (commentController.text.trim().isNotEmpty) {
//                                             _addComment(commentController.text.trim());
//                                             commentController.clear();
//                                             Navigator.pop(context); // Close the bottom sheet
//                                           }
//                                         },
//                                       ),
//                                     ),
//                                     style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         );
//                       },
//                       icon: Row(
//                         children: [
//                           Icon(Icons.insert_comment, size: 28),
//                           const SizedBox(width: 5),
//                           Text("${comments.length}", style: const TextStyle(fontSize: 18)),
//                         ],
//                       ),
//                     ),

//                     // Share Button
//                     IconButton(
//                       onPressed: () {},
//                       icon: const Icon(Icons.share, size: 28),
//                     ),

//                     const Spacer(),

//                     // Save Button
//                     IconButton(
//                       onPressed: () {},
//                       icon: const Icon(Icons.save, size: 28),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 10),

//                 // Post Description
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       widget.post.textname,
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: isDarkMode ? Colors.white : Colors.black,
//                       ),
//                     ),
//                     const SizedBox(width: 10),
//                     Expanded(
//                       child: Text(
//                         widget.post.destext,
//                         style: const TextStyle(fontSize: 18),
//                         softWrap: true,
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 10),

//           // Divider
//           Divider(color: Colors.grey, endIndent: 20, indent: 20),
//           const SizedBox(height: 10),
//         ],
//       ),
//     );
//   }
// }


import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:instgram_app/data/postHomepagemodel.dart';
import 'package:instgram_app/ui/dark/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostsHomePage extends StatefulWidget {
  final Post post;

  PostsHomePage({super.key, required this.post});

  @override
  State<PostsHomePage> createState() => _PostsState();
}

class _PostsState extends State<PostsHomePage> {
  List<Map<String, Object>> comments = [];
  TextEditingController commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadLikeData();
    _loadComments();
  }

  Future<void> _loadLikeData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      widget.post.likes = prefs.getInt('${widget.post.imagePath}_like_count') ?? 0;
      widget.post.isLiked = prefs.getBool('${widget.post.imagePath}_is_liked') ?? false;
    });
  }

  Future<void> _saveLikeData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('${widget.post.imagePath}_like_count', widget.post.likes);
    await prefs.setBool('${widget.post.imagePath}_is_liked', widget.post.isLiked);
  }

  void _toggleLike() {
    setState(() {
      widget.post.isLiked = !widget.post.isLiked;
      widget.post.isLiked ? widget.post.likes++ : widget.post.likes--;
    });
    _saveLikeData();
  }

  Future<void> _loadComments() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? storedComments = prefs.getStringList('${widget.post.imagePath}_comments');
    setState(() {
      comments = storedComments?.map((comment) {
        List<String> parts = comment.split('::');
        return {'text': parts[0], 'likes': int.tryParse(parts[1]) ?? 0};
      }).toList().cast<Map<String, Object>>() ?? [];
      comments.sort((a, b) => (b['likes'] as int).compareTo(a['likes'] as int));
    });
  }

  Future<void> _saveComments() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> commentStrings = comments.map((c) => '${c['text']}::${c['likes']}').toList();
    await prefs.setStringList('${widget.post.imagePath}_comments', commentStrings);
  }

  void _addComment(String text) {
    setState(() {
      comments.add({'text': text, 'likes': 0});
    });
    _saveComments();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.themeMode == ThemeMode.dark;
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          _buildPostHeader(isDarkMode),
          _buildPostImage(),
          _buildPostActions(isDarkMode),
          const SizedBox(height: 10),
          const Divider(color: Colors.grey, endIndent: 20, indent: 20),
        ],
      ),
    );
  }

  Widget _buildPostHeader(bool isDarkMode) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          CircleAvatar(radius: 20, backgroundImage: AssetImage(widget.post.imageaccount)),
          const SizedBox(width: 10),
          Text(
            widget.post.textname,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: isDarkMode ? Colors.white : Colors.black),
          ),
        ],
      ),
    );
  }

  Widget _buildPostImage() {
    return Column(
      children: [
        const SizedBox(height: 10),
        Image.asset(widget.post.imagePath, fit: BoxFit.fill),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildPostActions(bool isDarkMode) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          IconButton(
            icon: Icon(widget.post.isLiked ? Icons.favorite : Icons.favorite_border, color: widget.post.isLiked ? Colors.red : Colors.grey, size: 30),
            onPressed: _toggleLike,
          ),
          Text("${widget.post.likes} ${'Likes'.tr()}", style: TextStyle(color: isDarkMode ? Colors.white : Colors.black, fontSize: 18)),
          _buildCommentButton(),
          const Spacer(),
          IconButton(onPressed: () {}, icon: const Icon(Icons.share, size: 28)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.save, size: 28)),
        ],
      ),
    );
  }

  Widget _buildCommentButton() {
    return IconButton(
      onPressed: _showCommentSection,
      icon: Row(
        children: [
          const Icon(Icons.insert_comment, size: 28),
          const SizedBox(width: 5),
          Text("${comments.length}", style: const TextStyle(fontSize: 18)),
        ],
      ),
    );
  }

  void _showCommentSection() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.5, // نصف الشاشة
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: _buildCommentSection(),
        );
      },
    );
  }
Widget _buildCommentSection() {
  final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.themeMode == ThemeMode.dark;
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      // العنوان
       Padding(
        padding: EdgeInsets.all(12.0),
        child: Text(
          "Comments".tr(),
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      
      Expanded(
        child: ListView.builder(
          itemCount: comments.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                comments[index]['text'].toString(),
                style:  TextStyle( color: isDarkMode ? Colors.white : Colors.black),
              ),
            );
          },
        ),
      ),

      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: commentController,
            style: TextStyle( color: isDarkMode ? Colors.black : Colors.white, fontSize: 20),
          decoration: InputDecoration(
            hintText: "Write a comment...".tr(),
             hintStyle: TextStyle( color: isDarkMode ? Colors.black : Colors.white, fontSize: 20),
            filled: true,
            fillColor: Colors.white,
            suffixIcon: IconButton(
              icon:  Icon(Icons.send, color: isDarkMode ? Colors.black : Colors.white,),
              onPressed: () {
                if (commentController.text.isNotEmpty) {
                  _addComment(commentController.text);
                  commentController.clear();
                }
              },
            ),
          ),
        ),
      ),
      const SizedBox(height: 10),
    ],
  );
}

}
