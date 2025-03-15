// import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
// import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:instgram_app/ui/dark/theme_provider.dart';
// import 'package:instgram_app/ui/provider_pickimage/ImageUploadScreen.dart';
// import 'package:instgram_app/ui/screans/Login.dart';
// import 'package:instgram_app/ui/screans/search_screan.dart';

// import 'package:instgram_app/ui/screans/home_page.dart';
// import 'package:instgram_app/ui/screans/my_acount.dart';

// import 'package:instgram_app/ui/screans/signup.dart';
// import 'package:provider/provider.dart';

// class BottomNavBar extends StatefulWidget {
//   @override
//   _BottomNavBarState createState() => _BottomNavBarState();
// }

// class _BottomNavBarState extends State<BottomNavBar> {
//   int _page = 0;
//   GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

//   final List<Widget> _pages = [
//     HomePage(),
//     SearchPage(),
//     ImageUploadScreen(),
//     Signup(),
//     MyAcount(),
//   ];

// //grid_on  assignment_ind_outlined assignment_ind_rounded
// // library_add_outlined  location_history
// // location_history_outlined   movie_filter_rounded
// // my_library_add   ondemand_video  smart_display_outlined
// // subscriptions_outlined
//   //video_collection_outlined   view_comfortable account_circle

//   @override
//   Widget build(BuildContext context) {
//         final themeProvider = Provider.of<ThemeProvider>(context);
//     bool isDarkMode = themeProvider.themeMode == ThemeMode.dark;
//     return Scaffold(
//       bottomNavigationBar: CurvedNavigationBar(
//         key: _bottomNavigationKey,
//         index: _page,
//         items: [
//           CurvedNavigationBarItem(
//             child: Icon(
//               Icons.home_outlined,
//              // color: Colors.white,
//             ),
//             label: 'Home'.tr(),
//            // labelStyle: TextStyle(color: Colors.white),
//           ),
//           CurvedNavigationBarItem(
//             child: Icon(
//               Icons.search,
//              // color: Colors.white,
//             ),
//             label: 'Search'.tr(),
//           //  labelStyle: TextStyle(color: Colors.white),
//           ),
//           CurvedNavigationBarItem(
//             child: Icon(
//               Icons.my_library_add,
//             //  color: Colors.white,
//             ),
//             label: 'Add'.tr(),
//            // labelStyle: TextStyle(color: Colors.white),
//           ),
//           CurvedNavigationBarItem(
//             child: Icon(
//               Icons.video_collection,
//              // color: Colors.white,
//             ),
//             label: 'Vedio'.tr(),
//            // labelStyle: TextStyle(color: Colors.white),
//           ),
//           CurvedNavigationBarItem(
//             child: Icon(
//               Icons.account_circle,
//             //  color: Colors.white,
//             ),
//             label: 'Account'.tr(),
//           //  labelStyle: TextStyle(color: Colors.white),
//           ),
//         ],
//      color: isDarkMode ? Colors.black : Colors.white,
        
//         buttonBackgroundColor: isDarkMode ? Colors.black : Colors.white,
//         backgroundColor: Color(0xFFE31D8E),
//         animationCurve: Curves.easeInOut,
//         animationDuration: Duration(milliseconds: 600),
//         onTap: (index) {
//           setState(() {
//             _page = index;
//           });
//         },
//         letIndexChange: (index) => true,
//       ),
//       body: _pages[_page],
//     );
//   }
// }
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instgram_app/logic/imagepike/cubit_create_note.dart';
import 'package:instgram_app/ui/dark/theme_provider.dart';
import 'package:instgram_app/ui/other_profile/search_screan.dart';
import 'package:instgram_app/ui/provider_pickimage/ImageUploadScreen.dart';
import 'package:instgram_app/ui/screans/home_page.dart';
import 'package:instgram_app/ui/screans/my_acount.dart';
import 'package:instgram_app/ui/screans/search_screan.dart';
import 'package:instgram_app/ui/screans/signup.dart';
import 'package:instgram_app/ui/screans/vidio_screan.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.themeMode == ThemeMode.dark;

    final List<Widget> pages = [
      HomePage(),
      //SearchPage(),
      SeeeeearchPage(),
      BlocProvider( // ✅ لف فقط ImageUploadScreen بـ BlocProvider
        create: (context) => MediaUploadCubit(),
        child: MediaUploadScreen(),
      ),
      VideoFeedPage(),
      MyAcount(),
    ];

    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: _page,
        items: [
          CurvedNavigationBarItem(
            child: Icon(Icons.home_outlined),
            label: 'Home'.tr(),
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.search),
            label: 'Search'.tr(),
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.my_library_add),
            label: 'Add'.tr(),
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.video_collection),
            label: 'Vedio'.tr(),
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.account_circle),
            label: 'Account'.tr(),
          ),
        ],
        color: isDarkMode ? Colors.black : Colors.white,
        buttonBackgroundColor: isDarkMode ? Colors.black : Colors.white,
        backgroundColor: const Color(0xFFE31D8E),
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: pages[_page],
    );
  }
}
