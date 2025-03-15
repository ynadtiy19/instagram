// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:instgram_app/ui/dark/theme_provider.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class Posts extends StatefulWidget {
//   final String imagePath;
//   final String destext;

//   Posts({super.key, required this.imagePath, required this.destext});

//   @override
//   State<Posts> createState() => _PostsState();
// }

// class _PostsState extends State<Posts> {
//   int _likes = 0;
//   bool _isLiked = false;

//   @override
//   void initState() {
//     super.initState();
//     _loadLikeData();
//   }

//   // Load saved like count and state for THIS specific image
//   Future<void> _loadLikeData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       _likes = prefs.getInt('${widget.imagePath}_like_count') ?? 0;
//       _isLiked = prefs.getBool('${widget.imagePath}_is_liked') ?? false;
//     });
//   }

//   // Save like count and state for THIS specific image
//   Future<void> _saveLikeData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setInt('${widget.imagePath}_like_count', _likes);
//     prefs.setBool('${widget.imagePath}_is_liked', _isLiked);
//   }

//   void _toggleLike() {
//     setState(() {
//       if (_isLiked) {
//         if (_likes > 0) _likes--; // Prevent likes from going below zero
//       } else {
//         _likes++;
//       }
//       _isLiked = !_isLiked;
//     });
//     _saveLikeData(); // Save the state for this specific image
//   }

//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context);
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
//                   backgroundImage: AssetImage('assets/images/mohamed.jpeg'),
//                 ),
//                 SizedBox(width: 10),
//                 Text(
//                   'Mohamad Elansary',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: isDarkMode ? Colors.white : Colors.black,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 10),
//           Image.asset(widget.imagePath, fit: BoxFit.contain),
//           SizedBox(height: 10),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10),
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Row(
//                   children: [
//                     IconButton(
//                       icon: Icon(
//                         _isLiked ? Icons.favorite : Icons.favorite_border,
//                         color: _isLiked ? Colors.red : Colors.grey,
//                         size: 30,
//                       ),
//                       onPressed: _toggleLike,
//                     ),
//                     Text(
//                       "$_likes ${'Likes'.tr()}",
//                       style: TextStyle(
//                           color: isDarkMode ? Colors.white : Colors.black,
//                           fontSize: 18),
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
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'mohamed_el.ansary',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: isDarkMode ? Colors.white : Colors.black,
//                       ),
//                     ),
//                     SizedBox(width: 10),
//                     Expanded(
//                       child: Text(
//                         widget.destext,
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
//  }

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instgram_app/logic/get_notes/cubit_get_notes.dart';
import 'package:instgram_app/logic/get_notes/state_get_notes.dart';
import 'package:instgram_app/ui/dark/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Posts extends StatefulWidget {
  final String imagePath;
  final String destext;

  Posts({super.key, required this.imagePath, required this.destext});

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  int _likes = 0;
  bool _isLiked = false;
  List<String> _comments = [];
  TextEditingController _commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadLikeData();
    _loadComments();
  }

  Future<void> _loadLikeData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _likes = prefs.getInt('${widget.imagePath}_like_count') ?? 0;
      _isLiked = prefs.getBool('${widget.imagePath}_is_liked') ?? false;
    });
  }

  Future<void> _saveLikeData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('${widget.imagePath}_like_count', _likes);
    prefs.setBool('${widget.imagePath}_is_liked', _isLiked);
  }

  void _toggleLike() {
    setState(() {
      if (_isLiked) {
        if (_likes > 0) _likes--;
      } else {
        _likes++;
      }
      _isLiked = !_isLiked;
    });
    _saveLikeData();
  }

  Future<void> _loadComments() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _comments = prefs.getStringList('${widget.imagePath}_comments') ?? [];
    });
  }

  Future<void> _saveComments() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('${widget.imagePath}_comments', _comments);
  }

  void _addComment(String comment) {
    setState(() {
      _comments.add(comment);
    });
    _saveComments();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.themeMode == ThemeMode.dark;

    return BlocBuilder<GetNotesCubit, GetNotesState>(
      builder: (context, state) {
        if (state is GetNotesLoodingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is GetNotesSucssesState) {
          var profileData = state.note.first;

          return Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage:
                            AssetImage('assets/images/mohamed.jpeg'),
                      ),
                      SizedBox(width: 10),
                      Text(
                        profileData.username,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Image.asset(widget.imagePath, fit: BoxFit.contain),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              _isLiked ? Icons.favorite : Icons.favorite_border,
                              color: _isLiked ? Colors.red : Colors.grey,
                              size: 30,
                            ),
                            onPressed: _toggleLike,
                          ),
                          Text(
                            "$_likes ${'Likes'.tr()}",
                            style: TextStyle(
                                color: isDarkMode ? Colors.white : Colors.black,
                                fontSize: 18),
                          ),
                          IconButton(
                            onPressed: () {
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
                                            itemCount: _comments.length,
                                            itemBuilder: (context, index) {
                                              return ListTile(
                                                title: Text(_comments[index],
                                                    style: TextStyle(
                                                       color: isDarkMode ? Colors.white : Colors.black)),
                                              );
                                            },
                                          ),
                                        ),
                                        TextField(
                                          controller: _commentController,
                                           style: TextStyle( color: isDarkMode ? Colors.black : Colors.white, fontSize: 20),
                                          decoration: InputDecoration(
                                            hintText: "Write a comment...".tr(),
                                             hintStyle: TextStyle( color: isDarkMode ? Colors.black : Colors.white, fontSize: 20),
                                            filled: true,
                                            fillColor: Colors.white,
                                            suffixIcon: IconButton(
                                              icon: Icon(Icons.send,color: isDarkMode ? Colors.black : Colors.white,),
                                              onPressed: () {
                                                if (_commentController
                                                    .text.isNotEmpty) {
                                                  _addComment(
                                                      _commentController.text);
                                                  _commentController.clear();
                                                }
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            icon: Row(
                              children: [
                                Icon(Icons.insert_comment, size: 28),
                                SizedBox(width: 5),
                                Text("${_comments.length}",
                                    style: TextStyle(fontSize: 18)),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.share, size: 28),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.save, size: 28),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                           profileData.name!,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: isDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              widget.destext,
                              style: TextStyle(fontSize: 18),
                              softWrap: true,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else if (state is GetNotesErrorState) {
          return Center(child: Text("Error: ${state.messageError}"));
        }
        return Center(child: Text("No Data Available").tr());
      },
    );
  }
}


