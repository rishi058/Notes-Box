import 'package:flutter/material.dart';
import 'package:notes_box/Sizer/sizer.dart';
import 'package:notes_box/styling/colors.dart';
import 'package:notes_box/styling/typography.dart';

Widget loginButton(){
  return Container(
    width: 60.w,
    height: 4.5.h,
    decoration: BoxDecoration(
      border: Border.all(width: 1.5, color: CustomColors().white),
      borderRadius: BorderRadius.circular(1.w),
    ),
    child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(width:2.w),
        Padding(
            padding: EdgeInsets.all(0.75.h),
            child: Image.asset('assets/master.png')),
        SizedBox(width:4.w),
        Text('Sign In with Google', style: theme(sz: 3, sp: 2))
      ],
    ),
  );
}