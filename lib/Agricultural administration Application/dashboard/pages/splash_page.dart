import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hessen_app/Agricultural%20administration%20Application/dashboard/pages/dashboard_page.dart';
import 'package:hessen_app/Agricultural%20administration%20Application/login/pages/login_pages.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({
    super.key,
  });
  static String id = 'splash';

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Image.asset(
        'assets/images/logo.jpg',
        width: 200,
        // height: 200,
        fit: BoxFit.cover,
      ),
      splashIconSize: 200,
      nextScreen: FirebaseAuth.instance.currentUser != null
          ? const HomePage()
          : const LoginPage(),
      splashTransition: SplashTransition.slideTransition,
    );
  }
}
