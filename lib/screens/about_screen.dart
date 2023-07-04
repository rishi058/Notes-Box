import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_box/Sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../styling/colors.dart';
import '../widgets/small_buttons.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  Widget text(String value) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: RichText(
        textAlign: TextAlign.left,
        text: TextSpan(
            text: value,
            style: TextStyle(
                color: Colors.white70,
                fontSize: 1.75.h
            )),
      ),
    );
  }

  Widget text2() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: RichText(
        text: TextSpan(
          text: "We value your feedback and suggestions. If you have any questions, concerns, or ideas for improving our app, please don't hesitate to reach out to us. You can contact us at ",
          style: TextStyle(color: Colors.white70, fontSize: 1.75.h),
          children: [
            TextSpan(
                text:"devwizards01@gmail.com",
                style: TextStyle(color: Colors.blue, fontSize: 1.75.h),),
            TextSpan(
                text: " or reach us at ",
                style: TextStyle(color: Colors.white70, fontSize: 1.75.h),
            ),
            TextSpan(
                text: "Linkedin",
                style: TextStyle(color: Colors.blue, fontSize: 1.75.h, decoration: TextDecoration.underline),
                  recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  await launch('https://www.linkedin.com/in/rishi-raj-32648a196/');
                },
            ),

            TextSpan(
              text: " We are here to assist you and make your note-taking experience exceptional.",
              style: TextStyle(color: Colors.white70, fontSize: 1.75.h),),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 12.h,
        backgroundColor: CustomColors().black,
        title: InkWell(
            onTap: (){Get.back();},
            child: backButton()
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
              text("Welcome to our note-taking app! We are a dedicated team passionate about providing you with a seamless and intuitive note-taking experience. Our goal is to help you capture your thoughts, ideas, and important information effortlessly, keeping you organized and productive. Our note app offers a user-friendly interface, allowing you to create, edit, and organize your notes with ease. "),
              text("All rights reserved. This note app and its content are protected by copyright laws. The unauthorized use, reproduction, or distribution of any part of this app is strictly prohibited."),
              text("We value your feedback and suggestions. If you have any questions, concerns, or ideas for improving our app, please don't hesitate to reach out to us. You can contact us at devwizards01@gmail.com or reach us at . We are here to assist you and make your note-taking experience exceptional."),
              text2(),
          ],
        ),
      ),
    );
  }
}

