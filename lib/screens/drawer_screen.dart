import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:notes_box/Sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:notes_box/services/authentication.dart';
import 'package:notes_box/widgets/log_out_dialog.dart';
import 'package:notes_box/widgets/small_buttons.dart';

import '../widgets/snackbar.dart';

Widget myDrawer(BuildContext context){
  String? url = FirebaseAuth.instance.currentUser?.photoURL;
  String? name = FirebaseAuth.instance.currentUser?.displayName;
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
              Chip(label: Text(name!)),
              SizedBox(height: 1.h),
              InkWell(
                borderRadius: BorderRadius.circular(1.h),
                onTap: () async {
                  Authentication.switchAccounts(context);
                },
                child: Chip(label: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(gmail!),
                    SizedBox(width: 1.h),
                    const Icon(Icons.swap_horiz_outlined),
                  ],
                ),),
              ),
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