// import 'package:flutter/material.dart';
// import 'package:instgram_app/ui/widget/postListhomepage.dart';

// import 'package:instgram_app/ui/widget/llist_story_home_page.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'instagram',
//                   style: TextStyle(
//                       fontSize: 30,
//                       fontFamily: 'Pacifico',
//                       color: Colors.black),
//                 ),
//                 Spacer(
//                   flex: 1,
//                 ),
//                 IconButton(
//                   onPressed: () {},
//                   icon: Icon(
//                     Icons.favorite_border,
//                     size: 26,
//                   ),
//                 ),
//                 IconButton(
//                   onPressed: () {},
//                   icon: Icon(
//                     Icons.message_outlined,
//                     size: 26,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 15),
//           LlistStoryHomePage(),
//           SizedBox(height: 15),
//          Postlisthomepage(),
//         ],
//       ),
//     );
//   }
// }

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:instgram_app/ui/dark/theme_provider.dart';
import 'package:instgram_app/ui/screans/Login.dart';
import 'package:instgram_app/ui/screans/favorite_page.dart';
import 'package:instgram_app/ui/widget/postListhomepage.dart';
import 'package:instgram_app/ui/widget/llist_story_home_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
           final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.themeMode == ThemeMode.dark;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 30)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'instagram'.tr(),
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Pacifico',
                            color: isDarkMode ? Colors.white : Colors.black,),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  IconButton(
                    onPressed: () {setState(() {
                       Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return FavoritePage();
                        }),
                      );
                    });},
                    icon: Icon(
                      Icons.favorite_border,
                      size: 26,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.message_outlined,
                      size: 26,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 15)),
          SliverToBoxAdapter(child: LlistStoryHomePage()),
          SliverToBoxAdapter(child: Postlisthomepage()),
        ],
      ),
    );
  }
}
