import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instgram_app/logic/sginup_bloc/cubit_sginup.dart';
import 'package:instgram_app/logic/sginup_bloc/state_sginup.dart';
import 'package:instgram_app/ui/dark/theme_provider.dart';

import 'package:instgram_app/ui/screans/BottomNavBar.dart';
import 'package:instgram_app/ui/screans/home_page.dart';
import 'package:instgram_app/ui/widget/container_button.dart';
import 'package:instgram_app/ui/widget/text_email.dart';
import 'package:instgram_app/ui/widget/text_password.dart';
import 'package:provider/provider.dart';

class Signup extends StatelessWidget {
  Signup({super.key});
  // TextEmail textEmailFullName = TextEmail(
  //   maxLines: 1,
  //   minLines: 1,
  //   hinttext: 'Full Name',
  // );
  // TextEmail textEmailUserName = TextEmail(
  //   maxLines: 1,
  //   minLines: 1,
  //   hinttext: 'UserName',
  // );
  TextEmail textEmail = TextEmail(
    maxLines: 1,
    minLines: 1,
    hinttext: 'Email',
  );
  TextPassword textPassword = TextPassword(
    maxLines: 1,
    minLines: 1,
    hinttext: 'password',
  );

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.themeMode == ThemeMode.dark;
    return Scaffold(
      body: BlocProvider(
        create: (context) {
          return SginupCubit(FirebaseAuth.instance);
        },
        child: BlocConsumer<SginupCubit, SginupState>(
          listener: (context, State) {
            if (State is SginupSucssesState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: isDarkMode ? Colors.white : Colors.black,
                  content: Text(
                    'Yous email and password was create sucessful'.tr(),
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              );
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return BottomNavBar();
              }));
            } else if (State is SginupErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(State.messageError)),
              );
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: 220,
                  ),
                  Text(
                    'instagram'.tr(),
                    style: TextStyle(
                      fontSize: 60,
                      fontFamily: 'Pacifico',
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  // TextEmail(
                  //   maxLines: 1,
                  //   minLines: 1,
                  //   hinttext: 'Full Name',
                  // ),
                  // textEmailFullName,
                  SizedBox(
                    height: 20,
                  ),
                  // TextEmail(
                  //   maxLines: 1,
                  //   minLines: 1,
                  //   hinttext: 'UserName',
                  // ),
                  // textEmailUserName,
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // TextEmail(
                  //   maxLines: 1,
                  //   minLines: 1,
                  //   hinttext: 'Email',
                  // ),
                  textEmail,
                  SizedBox(
                    height: 20,
                  ),
                  // TextPassword(
                  //   maxLines: 1,
                  //   minLines: 1,
                  //   hinttext: 'Password',
                  // ),
                  textPassword,
                  SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    // onTap: () {
                    //   Navigator.push(context, MaterialPageRoute(builder: (context) {
                    //     return BottomNavBar();
                    //   }));

                    // },
                    onTap: () {
                      context.read<SginupCubit>().sginUp(
                          textEmail.emailController.text,
                          textPassword.passController.text);
                    },
                    child: ContainerButton(
                      text: 'SignUp'.tr(),
                      heightt: 60,
                      colorContaner: Colors.blue,
                      colorText: Colors.white,
                      weightt: double.infinity,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}



/*

      */ 