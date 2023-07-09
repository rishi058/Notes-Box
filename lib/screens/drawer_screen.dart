import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes_box/Sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:notes_box/services/authentication.dart';
import 'package:notes_box/widgets/log_out_dialog.dart';
import 'package:notes_box/widgets/small_buttons.dart';

Widget myDrawer(BuildContext context){
  String? url = FirebaseAuth.instance.currentUser?.photoURL;
  String? gmail = FirebaseAuth.instance.currentUser?.email;

  return SafeArea(
      child: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 7.h),
              Container(
                width: 125,
                height: 125,
                decoration: BoxDecoration(
                  border: Border.all(width: 0.5, color: Colors.grey),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(url!),
                      fit: BoxFit.fill),
                ),
              ),
              SizedBox(height: 3.h),
              Chip(label: Text(gmail!)),
              SizedBox(height: 6.h),
                InkWell(
                    onTap: (){
                      showLogoutBox(context).then((value){
                        if(value){
                          Authentication.signOut(context: context);
                        }
                      });
                    },
                    child: logOutButton()),
              SizedBox(height: 2.h),
              InkWell(
                  onTap: (){Get.toNamed('about-us-screen');},
                  child: aboutUsButton()),
              SizedBox(height: 7.h),
            ],
          ),
        ),

  ));
}