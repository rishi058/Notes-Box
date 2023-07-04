import 'package:flutter/material.dart';
import 'package:notes_box/Sizer/sizer.dart';
import '../styling/typography.dart';


Widget searchButton(){
  return Container(
    height: 5.5.h,
    width: 5.5.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(1.25.h),
      color: Colors.grey.withOpacity(0.25),
    ),
    child: Padding(
        padding: EdgeInsets.all(0.5.h),
        child: Image.asset('assets/search.png')),
  );
}

Widget saveButton(){
  return Container(
    height: 4.5.h,
    width: 8.5.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(1.25.h),
      color: Colors.grey.withOpacity(0.25),
    ),
    child: Padding(
        padding: EdgeInsets.all(0.5.h),
        child: Center(child: Text('Save', style: theme(sz: 4)))),
  );
}

Widget updateButton(){
  return Container(
    height: 4.5.h,
    width: 8.5.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(1.25.h),
      color: Colors.grey.withOpacity(0.25),
    ),
    child: Padding(
        padding: EdgeInsets.all(0.5.h),
        child: Center(child: Text('Update', style: theme(sz: 4)))),
  );
}

Widget deleteButton(){
  return Container(
    height: 5.5.h,
    width: 5.5.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(1.25.h),
      color: Colors.grey.withOpacity(0.25),
    ),
    child: Padding(
        padding: EdgeInsets.all(0.5.h),
        child: const Icon(Icons.delete)),
  );
}

Widget backButton(){
  return Container(
    height: 5.5.h,
    width: 5.5.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(1.25.h),
      color: Colors.grey.withOpacity(0.25),
    ),
    child: Padding(
        padding: EdgeInsets.all(0.5.h),
        child: const Icon(Icons.arrow_back_ios_rounded)),
  );
}

Widget menuButton(){
  return Container(
    height: 5.5.h,
    width: 5.5.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(1.25.h),
      color: Colors.grey.withOpacity(0.25),
    ),
    child: Padding(
        padding: EdgeInsets.all(0.8.h),
        child: Image.asset('assets/menu.png')),
  );
}

Widget logOutButton(){
  return Container(
    height: 6.h,
    width: 30.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(1.25.h),
      color: Colors.grey.withOpacity(0.25),
    ),
    child: Padding(
        padding: EdgeInsets.all(0.8.h),
        child: Row(
        children: [
          SizedBox(width: 2.h),
          const Icon(Icons.logout),
          SizedBox(width: 2.h),
          Text('Log Out', style: theme(sz: 3.3),)
        ],
  ),),
  );
}

Widget aboutUsButton(){
  return Container(
    height: 6.h,
    width: 30.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(1.25.h),
      color: Colors.grey.withOpacity(0.25),
    ),
    child: Padding(
      padding: EdgeInsets.all(0.8.h),
      child: Row(
        children: [
          SizedBox(width: 2.h),
          const Icon(Icons.info_outlined),
          SizedBox(width: 2.h),
          Text('About Us', style: theme(sz: 3.3),)
        ],
      ),),
  );
}