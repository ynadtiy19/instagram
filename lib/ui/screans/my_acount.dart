// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:instgram_app/ui/screans/ProfileScreen.dart';
// import 'package:instgram_app/ui/widget/list_story_myaccount.dart';
// import 'package:instgram_app/ui/widget/bio.dart';
// import 'package:instgram_app/ui/widget/edit_profile.dart';
// import 'package:instgram_app/ui/widget/navigator_bar.dart';

// import 'package:instgram_app/ui/widget/under_navigator_bar.dart';

// class MyAcount extends StatelessWidget {
//   const MyAcount({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         shrinkWrap: true,
//         physics: BouncingScrollPhysics(),
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(height: 10),
//                 NavigatorBar(
//                   username: 'mohamed_elansary'.tr(),
//                 ),
//                 SizedBox(height: 10),
//                 UnderNavigatorBar(
//                   imagee: 'assets/images/mohamed.jpeg',
//                   name: 'Mohamed Elansary',
// numberPosts: 14,
// numberFollowers: 815,
// numberFollowing: 4579,
//                 ),
//                 SizedBox(height: 10),

//                 ExpandableText(
//                   text:
//                       '❤🦅Al.ahly🦅❤\nSoftware Engineer (SE) 📌🖤\nstudied computers and information (FCI)🖤💻\nB.D :15/1/2002✨\nNever Give up💛💫',
//                 ),

//                 SizedBox(height: 15),
//                 EditProfileInacount(),
//                 SizedBox(height: 15),
//                 ListStoryMyaccount(),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 500,
//             child: ProfileScreen(
//               photosImages: [
//                 "assets/images/mohamed1.jpeg",
//                 "assets/images/mohamed2.jpeg",
//                 "assets/images/mohamed3.jpeg",
//                 "assets/images/mohamed4.jpeg",
//                 "assets/images/mohamed5.jpeg",
//                 "assets/images/mohamed6.jpeg",
//                 "assets/images/mohamed7.jpeg",
//                 "assets/images/mohamed8.jpeg",
//                 "assets/images/mohamed9.jpeg",
//                 "assets/images/mohamed10.jpeg",
//                 "assets/images/mohamed11.jpeg",
//                 "assets/images/Graduation.jpeg",
//                 "assets/images/elmontaza.jpeg",
//               ],
//               photosDescriptions: [
//                 'blurry lights. deep mind✨🖤',
//                 'Beauty isn’t about pictures, it’s about who’s looking 🖤✨️',
//                 '🖤✨',
//                 'Gentle as usual✨🖤',
//                 'I don’t sweat, I sparkle✨',
//                 'A break ',
//                 'Think positive, live positive💭❤️‍🔥✨',
//                 'If it was easy, everyone would do it 🖤✨',
//                 '🧿👑',
//                 'We have dreams that have embraced the clouds of the sky🖤✨',
//                 '🖤🔥',
//                 '1st🥇✨',
//                 'officially graduated🖤✨',
//                 'Eid Mubarak🖤✨',
//               ],
//               videosImages: [
//                 "assets/images/WhatsApp Image 2025-02-12 at 5.36.25 PM (1).jpeg",
//                 "assets/images/WhatsApp Image 2025-02-12 at 5.36.25 PM.jpeg",
//                 "assets/images/WhatsApp Image 2025-02-12 at 5.36.26 PM (1).jpeg",
//                 'assets/images/MyMother.jpeg',
//                 "assets/images/WhatsApp Image 2025-02-12 at 5.36.26 PM (4).jpeg",
//                 "assets/images/WhatsApp Image 2025-02-12 at 5.36.26 PM.jpeg",
//                 "assets/images/WhatsApp Image 2025-02-12 at 5.36.27 PM (2).jpeg",
//                 "assets/images/WhatsApp Image 2025-02-12 at 5.36.27 PM.jpeg",
//                 "assets/images/mohamed10.jpeg",
//                 "assets/images/mohamed11.jpeg",
//                 "assets/images/Graduation.jpeg",
//                 "assets/images/elmontaza.jpeg",
//               ],
//               videosDescriptions: [
//                 'Mybro',
//                 '',
//                 'Mybro',
//                 '',
//                 'Mybro',
//                 '',
//                 'Mybro',
//                 'Mybro',
//                 '',
//                 '',
//                 '',
//                 '',
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instgram_app/logic/get_notes/cubit_get_notes.dart';

import 'package:instgram_app/logic/get_notes/state_get_notes.dart';
import 'package:instgram_app/ui/widget/bio.dart';
import 'package:instgram_app/ui/widget/navigator_bar.dart';
import 'package:instgram_app/ui/widget/under_navigator_bar.dart';
import 'package:instgram_app/ui/widget/edit_profile.dart';
import 'package:instgram_app/ui/widget/list_story_myaccount.dart';
import 'package:instgram_app/ui/screans/ProfileScreen.dart';

class MyAcount extends StatelessWidget {
  const MyAcount({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetNotesCubit()..getNotes(), // تحميل البيانات عند فتح الصفحة
      child: Scaffold(
        body: BlocBuilder<GetNotesCubit, GetNotesState>(
          builder: (context, state) {
            if (state is GetNotesLoodingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is GetNotesSucssesState) {
              var profileData =
                  state.note.first; // بيانات الحساب الأول من Firestore

              return ListView(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        NavigatorBar(username: profileData.username!),
                        SizedBox(height: 10),
                        UnderNavigatorBar(
                           imagee: 'assets/images/mohamed.jpeg',
                          name: profileData.name!,
                          numberPosts: 14,
                          numberFollowers: 815,
                          numberFollowing: 4579,
                        ),
                        SizedBox(height: 10),
                        ExpandableText(text: profileData.bio!),
                        SizedBox(height: 15),
                        EditProfileInacount(),
                        SizedBox(height: 15),
                        ListStoryMyaccount(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 400,
                    child: ProfileScreen(
                                photosImages: [
                "assets/images/mohamed1.jpeg",
                "assets/images/mohamed2.jpeg",
                "assets/images/mohamed3.jpeg",
                "assets/images/mohamed4.jpeg",
                "assets/images/mohamed5.jpeg",
                "assets/images/mohamed6.jpeg",
                "assets/images/mohamed7.jpeg",
                "assets/images/mohamed8.jpeg",
                "assets/images/mohamed9.jpeg",
                "assets/images/mohamed10.jpeg",
                "assets/images/mohamed11.jpeg",
                "assets/images/Graduation.jpeg",
                "assets/images/elmontaza.jpeg",
              ],
              photosDescriptions: [
                'blurry lights. deep mind✨🖤',
                'Beauty isn’t about pictures, it’s about who’s looking 🖤✨️',
                '🖤✨',
                'Gentle as usual✨🖤',
                'I don’t sweat, I sparkle✨',
                'A break ',
                'Think positive, live positive💭❤️‍🔥✨',
                'If it was easy, everyone would do it 🖤✨',
                '🧿👑',
                'We have dreams that have embraced the clouds of the sky🖤✨',
                '🖤🔥',
                '1st🥇✨',
                'officially graduated🖤✨',
                'Eid Mubarak🖤✨',
              ],
              videosImages: [
                "assets/images/WhatsApp Image 2025-02-12 at 5.36.25 PM (1).jpeg",
                "assets/images/WhatsApp Image 2025-02-12 at 5.36.25 PM.jpeg",
                "assets/images/WhatsApp Image 2025-02-12 at 5.36.26 PM (1).jpeg",
                'assets/images/MyMother.jpeg',
                "assets/images/WhatsApp Image 2025-02-12 at 5.36.26 PM (4).jpeg",
                "assets/images/WhatsApp Image 2025-02-12 at 5.36.26 PM.jpeg",
                "assets/images/WhatsApp Image 2025-02-12 at 5.36.27 PM (2).jpeg",
                "assets/images/WhatsApp Image 2025-02-12 at 5.36.27 PM.jpeg",
                "assets/images/mohamed10.jpeg",
                "assets/images/mohamed11.jpeg",
                "assets/images/Graduation.jpeg",
                "assets/images/elmontaza.jpeg",
              ],
              videosDescriptions: [
                'Mybro',
                '',
                'Mybro',
                '',
                'Mybro',
                '',
                'Mybro',
                'Mybro',
                '',
                '',
                '',
                '',
              ],
                    ),
                  ),
                ],
              );
            } else if (state is GetNotesErrorState) {
              return Center(child: Text("Error: ${state.messageError}"));
            }
            return Center(child: Text("No Data Available"));
          },
        ),
      ),
    );
  }
}
