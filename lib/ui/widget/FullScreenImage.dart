// import 'package:flutter/material.dart';
// import 'package:instgram_app/ui/widget/post_myAccount.dart';

// class FullScreenImage extends StatelessWidget {
//   final List<String> imagePaths; // List of all image paths
//   final List<String> descriptions; // List of all descriptions
//   final int initialIndex; // Index of the image that was tapped

//   FullScreenImage({
//     required this.imagePaths,
//     required this.descriptions,
//     this.initialIndex = 0,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: Column(
//           children: [
//             Center(
//               child: Text(
//                 'mohamed_el.ansary',
//                 style: TextStyle(fontSize: 20, color: Colors.grey),
//               ),
//             ),
//             Text(
//               'Posts',
//               style: TextStyle(
//                   fontSize: 25,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black),
//             ),
//           ],
//         ),
//       ),
//       body: PageView.builder(
//         scrollDirection: Axis.vertical,
//         controller: PageController(
//             initialPage: initialIndex), // Start at the tapped image
//         itemCount: imagePaths.length,
//         itemBuilder: (context, index) {
//           return Posts(
//               imagePath: imagePaths[index], destext: descriptions[index]);
//         },
//       ),
//     );
//   }
// }


// import 'package:easy_localization/easy_localization.dart';

// import 'package:flutter/material.dart';
// import 'package:instgram_app/data/testmodel.dart';
// import 'package:instgram_app/ui/dark/theme_provider.dart';
// import 'package:instgram_app/ui/widget/post_myAccount.dart';
// import 'package:provider/provider.dart';

// class FullScreenImage extends StatelessWidget {
//   final List<String> imagePaths;
//   final List<String> descriptions;
//   final int initialIndex;

//   FullScreenImage({
//     required this.imagePaths,
//     required this.descriptions,
   
     
//     this.initialIndex = 0,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context);
//     bool isDarkMode = themeProvider.themeMode == ThemeMode.dark;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: isDarkMode ? Colors.black : Colors.white,
//         leading: IconButton(
//           icon: Icon(
//             Icons.arrow_back,
//             color: isDarkMode ? Colors.white : Colors.black,
//           ),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: Column(
//           children: [
//             Center(
//               child: Text(
//                 'mohamed_el.ansary',
//                 style: TextStyle(
//                   fontSize: 20,
//                   color: isDarkMode ? Colors.grey : Colors.black,
//                 ),
//               ),
//             ),
//             Text(
//               'Posts'.tr(),
//               style: TextStyle(
//                   fontSize: 25,
//                   fontWeight: FontWeight.bold,
//                    color: isDarkMode ? Colors.white : Colors.black,),
//             ),
//           ],
//         ),
//       ),
//       body: PageView.builder(
//         scrollDirection: Axis.vertical,
//         controller: PageController(initialPage: initialIndex),
//         itemCount: imagePaths.length,
//         itemBuilder: (context, index) {
//           return Posts(
//               imagePath: imagePaths[index], destext: descriptions[index]);
//         },
//       ),
//     );
//   }
// } 


import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instgram_app/logic/get_notes/cubit_get_notes.dart';
import 'package:instgram_app/logic/get_notes/state_get_notes.dart';
import 'package:instgram_app/ui/dark/theme_provider.dart';
import 'package:instgram_app/ui/widget/post_myAccount.dart';
import 'package:provider/provider.dart';

class FullScreenImage extends StatelessWidget {
  final List<String> imagePaths;
  final List<String> descriptions;
  final int initialIndex;

  FullScreenImage({
    required this.imagePaths,
    required this.descriptions,
    this.initialIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.themeMode == ThemeMode.dark;
    return BlocProvider( create: (context) =>
          GetNotesCubit()..getNotes(),
      child: BlocBuilder<GetNotesCubit, GetNotesState>(
          builder: (context, state) {
            if (state is GetNotesLoodingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is GetNotesSucssesState) {
              var profileData =
                  state.note.first; // بيانات الحساب الأول من Firestore

              return  Scaffold(
          appBar: AppBar(
            backgroundColor: isDarkMode ? Colors.black : Colors.white,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            title: Column(
              children: [
                Center(
                  child: Text(
                   profileData.name!,
                    style: TextStyle(
                      fontSize: 20,
                      color: isDarkMode ? Colors.grey : Colors.black,
                    ),
                  ),
                ),
                Text(
                  'Posts'.tr(),
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                       color: isDarkMode ? Colors.white : Colors.black,),
                ),
              ],
            ),
          ),
          body: PageView.builder(
            scrollDirection: Axis.vertical,
            controller: PageController(initialPage: initialIndex),
            itemCount: imagePaths.length,
            itemBuilder: (context, index) {
              return Posts(
                  imagePath: imagePaths[index], destext: descriptions[index]);
            },
          ),
        );
            } else if (state is GetNotesErrorState) {
              return Center(child: Text("Error: ${state.messageError}"));
            }
            return Center(child: Text("No Data Available"));
          },
        ),
    );
  }
}








