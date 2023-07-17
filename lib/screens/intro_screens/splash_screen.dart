import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:notes_box/Sizer/sizer.dart';
import 'package:notes_box/screens/intro_screens/login_screen.dart';

import '../../services/login_status.dart';
import '../home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{

  void goto(BuildContext context, Widget page){
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => page,
        transitionDuration: const Duration(seconds: 1),
        transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
      ),
    );
  }

  void fun(BuildContext ctx) {
    Timer(const Duration(seconds: 2), () {
      if (isLoggedIn()) {
        goto(ctx, const HomeScreen());
      } else {
        goto(ctx, const LoginScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    fun(context);
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 10.h,
            child: Lottie.asset('assets/splash_screen_logo.json')
        ),
      ),
    );
  }
}
