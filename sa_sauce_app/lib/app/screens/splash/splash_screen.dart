import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sa_sauce_app/app/screens/article_posts/login_page.dart';
import 'package:sa_sauce_app/app/screens/login_page.dart';

// import '../../app.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SA SAUCE',
        home: AnimatedSplashScreen(
            duration: 3000,
            splash: ('assets/images/logo_white.png'),
            splashIconSize: 250,
            nextScreen: const LoginPage(),
            splashTransition: SplashTransition.slideTransition,
            pageTransitionType: PageTransitionType.bottomToTop,
            backgroundColor: Colors.blue));
  }
}
