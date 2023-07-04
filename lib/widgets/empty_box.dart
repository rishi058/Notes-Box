import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:notes_box/Sizer/sizer.dart';

Widget emptyBox(){
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
       SizedBox(
         height: 25.h,
         width: 25.h,
         child: Lottie.asset('assets/empty.json'),
       ),
        const Text('You do not have any Note.\nClick on Add Icon to create a new Note', textAlign: TextAlign.center),
      ],
    ),
  );
}