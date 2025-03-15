// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:instgram_app/data/edit_profile_model.dart';
// import 'package:instgram_app/logic/create_note/cubit_create_note.dart';
// import 'package:instgram_app/logic/create_note/state_create_note.dart';
// import 'package:instgram_app/ui/dark/theme_provider.dart';
// import 'package:instgram_app/ui/screans/BottomNavBar.dart';
// import 'package:instgram_app/ui/screans/my_acount.dart';
// import 'package:instgram_app/ui/widget/Text_For.dart';
// import 'package:provider/provider.dart';

// class EditProfile extends StatefulWidget {
//   EditProfile({super.key});

//   @override
//   State<EditProfile> createState() => _EditProfileState();
// }

// class _EditProfileState extends State<EditProfile> {
//   TextFor textName = TextFor(
//     firstTextt: 'Name'.tr(),
//     maxLines: 1,
//     minLines: 1,
//     hintext: 'Name'.tr(),
//     weightt: 65,
//   );
//   TextFor textUserName = TextFor(
//     firstTextt: 'UserName'.tr(),
//     maxLines: 1,
//     minLines: 1,
//     hintext: 'UserName'.tr(),
//     weightt: 20,
//   );
//   TextFor textWebsite = TextFor(
//     firstTextt: 'Website'.tr(),
//     maxLines: 1,
//     minLines: 1,
//     hintext: 'Website'.tr(),
//     weightt: 47,
//   );
//   TextFor textBio = TextFor(
//     firstTextt: 'Bio'.tr(),
//     maxLines: 2,
//     minLines: 1,
//     hintext: 'Bio'.tr(),
//     weightt: 95,
//   );
//   TextFor textEmail = TextFor(
//     firstTextt: 'Email'.tr(),
//     maxLines: 1,
//     minLines: 1,
//     hintext: 'Email'.tr(),
//     weightt: 65,
//   );
//   TextFor textPhone = TextFor(
//     firstTextt: 'Phone'.tr(),
//     maxLines: 1,
//     minLines: 1,
//     hintext: 'Phone'.tr(),
//     weightt: 20,
//   );
//   TextFor textGender = TextFor(
//     firstTextt: 'Gender'.tr(),
//     maxLines: 1,
//     minLines: 1,
//     hintext: 'Gender'.tr(),
//     weightt: 47,
//   );

//   bool iscancel = false;

//   bool isdone = false;

//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context);
//     bool isDarkMode = themeProvider.themeMode == ThemeMode.dark;
//     return BlocProvider(
//       create: (context) {
//         return CreateNoteCubit();
//       },
//       child: BlocConsumer<CreateNoteCubit, CreateNoteState>(
//         listener: (context, state) {
//           if (state is CreateNoteSucssesState) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 content: Text('Note is Create Successful'),
//               ),
//             );
//           } else if (state is CreateNoteErrorState) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 content: Text(state.messageError),
//               ),
//             );
//           }
//         },
//         builder: (context, state) {
//           return Scaffold(
//             body: Column(
//               children: [
//                 Container(
//                   color: isDarkMode ? Colors.black : Color(0xFFFAFAFA),
//                   width: double.infinity,
//                   height: 120,
//                   child: Padding(
//                     padding:
//                         const EdgeInsets.only(top: 40, right: 25, left: 25),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.push(context,
//                                 MaterialPageRoute(builder: (context) {
//                               return BottomNavBar();
//                             }));
//                           },
//                           child: Text(
//                             'Cancel'.tr(),
//                             style: TextStyle(
//                               fontSize: 22,
//                               color: isDarkMode ? Colors.white : Colors.black,
//                             ),
//                           ),
//                         ),
//                         Text(
//                           'Edit profile'.tr(),
//                           style: TextStyle(
//                             fontSize: 25,
//                             fontWeight: FontWeight.bold,
//                             color: isDarkMode ? Colors.white : Colors.black,
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             // Navigator.push(context,
//                             //     MaterialPageRoute(builder: (context) {
//                             //   return BottomNavBar();
//                             // }));

//                             context
//                                 .read<CreateNoteCubit>()
//                                 .createNote(
//                                   EditProfileModel(
                                  
//                                     name: textName.textController.text,
//                                     username: textUserName.textController.text,
//                                     website: textWebsite.textController.text,
//                                     bio: textBio.textController.text,
//                                     email: textEmail.textController.text,
//                                     phone: textPhone.textController.text,
//                                     gender: textGender.textController.text,
//                                   ),
//                                 );
//                             //     .then((x) {
//                             //   context.read<GetNotesCubit>().getNotes();
//                             //   Navigator.pop(context);
//                             // });
//                           },
//                           child: Text(
//                             'Done'.tr(),
//                             style: TextStyle(
//                                 fontSize: 22,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.blue),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 CircleAvatar(
//                   radius: 70,
//                   backgroundImage: AssetImage('assets/images/mohamed.jpeg'),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   'Change Profile Photo'.tr(),
//                   style: TextStyle(fontSize: 20, color: Colors.blue),
//                 ),
//                 SizedBox(
//                   height: 15,
//                 ),
//                 textName,
//                 SizedBox(
//                   height: 25,
//                 ),
//                 textUserName,
//                 SizedBox(
//                   height: 25,
//                 ),
//                 textWebsite,
//                 SizedBox(
//                   height: 25,
//                 ),
//                 textBio,
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Divider(
//                   color: Colors.grey,
//                   indent: 30,
//                   endIndent: 30,
//                   thickness: 1,
//                   height: 30,
//                 ),
//                 Text(
//                   'Switch to Professional Account'.tr(),
//                   style: TextStyle(fontSize: 20, color: Colors.blue),
//                 ),
//                 SizedBox(
//                   height: 15,
//                 ),
//                 textEmail,
//                 SizedBox(
//                   height: 25,
//                 ),
//                 textPhone,
//                 SizedBox(
//                   height: 25,
//                 ),
//                 textGender,
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }







import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instgram_app/data/edit_profile_model.dart';
import 'package:instgram_app/logic/create_note/cubit_create_note.dart';
import 'package:instgram_app/logic/create_note/state_create_note.dart';
import 'package:instgram_app/ui/dark/theme_provider.dart';
import 'package:instgram_app/ui/screans/BottomNavBar.dart';
import 'package:instgram_app/ui/widget/Text_For.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextFor textName = TextFor(
    firstTextt: 'Name'.tr(),
    maxLines: 1,
    minLines: 1,
    hintext: 'Name'.tr(),
    weightt: 65,
  );
  final TextFor textUserName = TextFor(
    firstTextt: 'UserName'.tr(),
    maxLines: 1,
    minLines: 1,
    hintext: 'UserName'.tr(),
    weightt: 20,
  );
  final TextFor textWebsite = TextFor(
    firstTextt: 'Website'.tr(),
    maxLines: 1,
    minLines: 1,
    hintext: 'Website'.tr(),
    weightt: 47,
  );
  final TextFor textBio = TextFor(
    firstTextt: 'Bio'.tr(),
    maxLines: 2,
    minLines: 1,
    hintext: 'Bio'.tr(),
    weightt: 95,
  );
  final TextFor textEmail = TextFor(
    firstTextt: 'Email'.tr(),
    maxLines: 1,
    minLines: 1,
    hintext: 'Email'.tr(),
    weightt: 65,
  );
  final TextFor textPhone = TextFor(
    firstTextt: 'Phone'.tr(),
    maxLines: 1,
    minLines: 1,
    hintext: 'Phone'.tr(),
    weightt: 20,
  );
  final TextFor textGender = TextFor(
    firstTextt: 'Gender'.tr(),
    maxLines: 1,
    minLines: 1,
    hintext: 'Gender'.tr(),
    weightt: 47,
  );

  File? _image;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final bool isDarkMode = themeProvider.themeMode == ThemeMode.dark;

    return BlocProvider(
      create: (context) => CreateNoteCubit(),
      child: BlocConsumer<CreateNoteCubit, CreateNoteState>(
        listener: (context, state) {
          if (state is CreateNoteSucssesState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Note is Created Successfully')),
            );
          } else if (state is CreateNoteErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.messageError)),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Column(
              children: [
                Container(
                  color: isDarkMode ? Colors.black : const Color(0xFFFAFAFA),
                  width: double.infinity,
                  height: 120,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40, right: 25, left: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BottomNavBar()),
                          ),
                          child: Text(
                            'Cancel'.tr(),
                            style: TextStyle(
                              fontSize: 22,
                              color: isDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                        Text(
                          'Edit profile'.tr(),
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.read<CreateNoteCubit>().createNote(
                              EditProfileModel(
                                name: textName.textController.text,
                                username: textUserName.textController.text,
                                website: textWebsite.textController.text,
                                bio: textBio.textController.text,
                                email: textEmail.textController.text,
                                phone: textPhone.textController.text,
                                gender: textGender.textController.text,
                              ),
                            );
                          },
                          child: Text(
                            'Done'.tr(),
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: _image != null ? FileImage(_image!) : const AssetImage('assets/images/mohamed.jpeg') as ImageProvider,
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: _pickImage,
                  child: Text(
                    'Change Profile Photo'.tr(),
                    style: const TextStyle(fontSize: 20, color: Colors.blue),
                  ),
                ),
                const SizedBox(height: 15),
                textName,
                const SizedBox(height: 25),
                textUserName,
                const SizedBox(height: 25),
                textWebsite,
                const SizedBox(height: 25),
                textBio,
                const SizedBox(height: 10),
                const Divider(
                  color: Colors.grey,
                  indent: 30,
                  endIndent: 30,
                  thickness: 1,
                  height: 30,
                ),
                Text(
                  'Switch to Professional Account'.tr(),
                  style: const TextStyle(fontSize: 20, color: Colors.blue),
                ),
                const SizedBox(height: 15),
                textEmail,
                const SizedBox(height: 25),
                textPhone,
                const SizedBox(height: 25),
                textGender,
              ],
            ),
          );
        },
      ),
    );
  }
}






















































































/*


import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  File? _image;
  final picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  final TextEditingController _nameController = TextEditingController(text: "Jacob West");
  final TextEditingController _usernameController = TextEditingController(text: "jacob_w");
  final TextEditingController _websiteController = TextEditingController(text: "Website");
  final TextEditingController _bioController = TextEditingController(text: "Digital goodies designer @pixsellz\nEverything is designed.");
  final TextEditingController _emailController = TextEditingController(text: "jacob.west@gmail.com");
  final TextEditingController _phoneController = TextEditingController(text: "+1 202 555 0147");
  final TextEditingController _genderController = TextEditingController(text: "Male");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Cancel", style: TextStyle(color: Colors.blue, fontSize: 10)),
        ),
        title: Text("Edit Profile", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {}, // Save changes logic
            child: Text("Done", style: TextStyle(color: Colors.blue)),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 20),
            GestureDetector(
              onTap: _pickImage,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: _image != null ? FileImage(_image!) : AssetImage('assets/profile_placeholder.png') as ImageProvider,
                  ),
                  SizedBox(height: 10),
                  Text("Change Profile Photo", style: TextStyle(color: Colors.blue)),
                ],
              ),
            ),
            SizedBox(height: 20),
            _buildTextField("Name", _nameController),
            _buildTextField("Username", _usernameController),
            _buildTextField("Website", _websiteController),
            _buildTextField("Bio", _bioController, maxLines: 3),
            SizedBox(height: 20),
            Text("Switch to Professional Account", style: TextStyle(color: Colors.blue)),
            SizedBox(height: 20),
            Divider(),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Private Information", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
            SizedBox(height: 10),
            _buildTextField("Email", _emailController),
            _buildTextField("Phone", _phoneController),
            _buildTextField("Gender", _genderController),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {int maxLines = 1}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          border: UnderlineInputBorder(),
        ),
      ),
    );
  }
}
 */