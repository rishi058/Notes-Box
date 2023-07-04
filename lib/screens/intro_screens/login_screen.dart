import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:notes_box/Sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:notes_box/services/authentication.dart';
import 'package:notes_box/styling/typography.dart';
import '../../widgets/login_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool isLoading = false;

  void setLoading(){
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Notes Box', style: theme(sz: 10, wt: FontWeight.w200, sp: 2)),
                SizedBox(height: 5.h),
                SizedBox(
                    width: 25.h,
                    height: 25.h,
                    child: Lottie.asset('assets/login.json')
                ),
                isLoading ?
                    const CircularProgressIndicator()
                    : InkWell(
                    onTap: () async {
                      setLoading();
                      Authentication.signInWithGoogle(context).then((value){
                        if(value){
                          Get.offAndToNamed('home-screen');
                        }
                        else{
                          setLoading();
                        }
                      });
                    },
                    child: loginButton()),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
