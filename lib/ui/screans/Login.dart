import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instgram_app/logic/login_bloc/cubit_login.dart';
import 'package:instgram_app/logic/login_bloc/state_login.dart';
import 'package:instgram_app/ui/dark/theme_provider.dart';

import 'package:instgram_app/ui/screans/BottomNavBar.dart';
import 'package:instgram_app/ui/screans/signup.dart';
import 'package:instgram_app/ui/widget/container_button.dart';
import 'package:instgram_app/ui/widget/text_email.dart';
import 'package:instgram_app/ui/widget/text_password.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  Login({super.key});
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
          return LoginCubit(FirebaseAuth.instance);
        },
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSucssesState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: isDarkMode ? Colors.black : Colors.white,
                  content: Text(
                    'Your email and password have been successfully entered'.tr(),
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              );
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return BottomNavBar();
              }));
            } else if (state is LoginErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.messageError),
                ),
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
                      onTap: () async {
                        final userEmail = textEmail.emailController.text;
                        final userPass = textPassword.passController.text;
                        await context
                            .read<LoginCubit>()
                            .Login(userEmail, userPass);
                      },
                      child: ContainerButton(
                        text: 'login'.tr(),
                        heightt: 60,
                        colorContaner: Colors.blue,
                        colorText: Colors.white,
                        weightt: double.infinity,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Do not have an email?'.tr(),
                        style: TextStyle(
                          fontSize: 16,
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Signup();
                          }));
                        },
                        child: Text(
                          'SignUp'.tr(),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ],
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
