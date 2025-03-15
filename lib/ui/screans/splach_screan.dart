import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:instgram_app/ui/screans/Login.dart';
import 'package:lottie/lottie.dart';



class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {






  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
    
      body: AnimatedSplashScreen(
        splash: Center(
          child: Lottie.asset(
            'assets/lottieAnimations/Animation - 1739028388901.json',
            width: 500,
            animate: true,
            repeat: false,
            fit: BoxFit.cover,
          ),
        ),
        backgroundColor: Colors.black,
        nextScreen: Login(),
        splashIconSize: double.infinity,
      ),
    );
  }
}





