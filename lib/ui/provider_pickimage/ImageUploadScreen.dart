// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:instgram_app/logic/imagepike/cubit_create_note.dart';
// import 'package:instgram_app/logic/imagepike/state_create_note.dart';
// import 'package:instgram_app/ui/dark/theme_provider.dart';
// import 'package:instgram_app/ui/screans/BottomNavBar.dart';
// import 'package:provider/provider.dart';

// class ImageUploadScreen extends StatelessWidget {
//   const ImageUploadScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context);
//     bool isDarkMode = themeProvider.themeMode == ThemeMode.dark;

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: isDarkMode ? Colors.black : Colors.white,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back,
//               color: isDarkMode ? Colors.white : Colors.black),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) {
//                   return BottomNavBar();
//                 },
//               ),
//             ); // 0 هو index لصفحة Home مثلاً
//           },
//         ),
//         title: Text(
//           "New Post".tr(),
//           style: TextStyle(
//             color: isDarkMode ? Colors.white : Colors.black, // ✅ إصلاح لون النص
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//         actions: [
//           BlocBuilder<ImageUploadCubit, ImageUploadState>(
//             builder: (context, state) {
//               return TextButton(
//                 onPressed: state is ImagePicked
//                     ? () => context.read<ImageUploadCubit>().uploadImage()
//                     : null,
//                 child: Text(
//                   "Post".tr(),
//                   style: TextStyle(
//                     color: state is ImagePicked ? Colors.blue : Colors.grey,
//                     fontSize: 16,
//                   ),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//       backgroundColor: isDarkMode ? Colors.black : Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.all(19.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // صورة المعاينة
//             BlocBuilder<ImageUploadCubit, ImageUploadState>(
//               builder: (context, state) {
//                 if (state is ImagePicked) {
//                   return Container(
//                     width: double.infinity,
//                     height: 350,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15),
//                       image: DecorationImage(
//                         image: FileImage(state.imageFile),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   );
//                 }
//                 return Container(
//                   width: double.infinity,
//                   height: 350,
//                   decoration: BoxDecoration(
//                     color: isDarkMode ? Colors.grey[900] : Colors.blue,
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   child: Center(
//                     child: Text(
//                       "No Image Picked".tr(),
//                       style: TextStyle(
//                         color: isDarkMode ? Colors.white : Colors.black,
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//             const SizedBox(height: 10),

//             // حقل كتابة الكابشن
//             TextField(
//               style: TextStyle(color: Colors.white),
//               decoration: InputDecoration(
//                 hintText: "Write a caption...".tr(),
//                 hintStyle: TextStyle(
//                   color: isDarkMode ? Colors.white : Colors.black,
//                 ),
//                 border: InputBorder.none,
//               ),
//             ),
//             const SizedBox(height: 20),

//             // زر اختيار الصورة
//             ElevatedButton(
//               onPressed: () => context.read<ImageUploadCubit>().pickImage(),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: isDarkMode ? Colors.grey[900] : Colors.blue,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               child: Text(
//                 "Pick Image".tr(),
//                 style: TextStyle(
//                   color:
//                       isDarkMode ? Colors.white : Colors.black, // ✅ إصلاح اللون
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10),

//             // مؤشر التحميل
//             BlocBuilder<ImageUploadCubit, ImageUploadState>(
//               builder: (context, state) {
//                 if (state is ImageUploading) {
//                   return Column(
//                     children: [
//                       LinearProgressIndicator(
//                         color: isDarkMode ? Colors.white : Colors.black,
//                       ),
//                       const SizedBox(height: 10),
//                       Text(
//                         "Uploading...".tr(),
//                         style: TextStyle(
//                           color: Colors.white,
//                         ),
//                       ),
//                     ],
//                   );
//                 }
//                 return const SizedBox.shrink();
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instgram_app/logic/imagepike/cubit_create_note.dart';
import 'package:instgram_app/logic/imagepike/state_create_note.dart';
import 'package:instgram_app/ui/dark/theme_provider.dart';
import 'package:instgram_app/ui/screans/BottomNavBar.dart';
import 'package:provider/provider.dart';

class MediaUploadScreen extends StatelessWidget {
  const MediaUploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.themeMode == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: isDarkMode ? Colors.white : Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return BottomNavBar();
                },
              ),
            );
          },
        ),
        title: Text(
          "New Post".tr(),
          style: TextStyle(
            color: isDarkMode ? Colors.white : Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          BlocBuilder<MediaUploadCubit, MediaUploadState>(
            builder: (context, state) {
              return TextButton(
                onPressed: state is MediaPicked
                    ? () => context.read<MediaUploadCubit>().uploadMedia()
                    : null,
                child: Text(
                  "Post".tr(),
                  style: TextStyle(
                    color: state is MediaPicked ? Colors.blue : Colors.grey,
                    fontSize: 16,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(19.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // معاينة الوسائط
            BlocBuilder<MediaUploadCubit, MediaUploadState>(
              builder: (context, state) {
                if (state is MediaPicked) {
                  return Container(
                    width: double.infinity,
                    height: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: state.isVideo
                          ? null
                          : DecorationImage(
                              image: FileImage(state.mediaFile),
                              fit: BoxFit.cover,
                            ),
                    ),
                    child: state.isVideo
                        ? Center(
                            child: Icon(
                              Icons.video_library,
                              color: Colors.white,
                              size: 50,
                            ),
                          )
                        : null,
                  );
                }
                return Container(
                  width: double.infinity,
                  height: 350,
                  decoration: BoxDecoration(
                    color: isDarkMode ? Colors.grey[900] : Colors.blue,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      "No Media Picked".tr(),
                      style: TextStyle(
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 10),

            // حقل كتابة الكابشن
            TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Write a caption...".tr(),
                hintStyle: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
                border: InputBorder.none,
              ),
            ),
            const SizedBox(height: 20),

            // أزرار اختيار الوسائط
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => context.read<MediaUploadCubit>().pickMedia(false),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isDarkMode ? Colors.grey[900] : Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Pick Image".tr(),
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => context.read<MediaUploadCubit>().pickMedia(true),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isDarkMode ? Colors.grey[900] : Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Pick Video".tr(),
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // مؤشر التحميل
            BlocBuilder<MediaUploadCubit, MediaUploadState>(
              builder: (context, state) {
                if (state is MediaUploading) {
                  return Column(
                    children: [
                      LinearProgressIndicator(
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Uploading...".tr(),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}