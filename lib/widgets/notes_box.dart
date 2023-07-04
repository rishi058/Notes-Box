import 'package:flutter/material.dart';
import 'package:notes_box/Sizer/sizer.dart';
import 'package:notes_box/services/helper.dart';
import '../models/note_model.dart';

String trimTitle(String str){
  if(str.length>17){
    return "${str.substring(0, 17)}...";
  }
  return str;
}

Widget customBox(int index, Note temp){

  double fx = tileHelper(index)[0];

  return Card(
      shape: RoundedRectangleBorder( 
       borderRadius: BorderRadius.circular(0.5.h)
      ),
      color: Color(int.parse(temp.color)),
      child: Stack(
        children: [
        Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              margin: EdgeInsets.only(left: 1.h, right: 1.h),
              child: Text(
                trimTitle(temp.title),
                textAlign: TextAlign.left,
                maxLines: 6,
                style: TextStyle(
                  overflow: TextOverflow.fade,
                  color: Colors.black,
                  fontSize: fx==2 ? 4.5.h : 3.5.h,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Flexible(
            child: Container(
              margin: EdgeInsets.only(bottom: 2.5.h, left: 1.h, right: 1.h),
              child: Text(
                temp.body,
                style: TextStyle(
                  overflow: TextOverflow.fade,
                  color: Colors.black87,
                  fontSize: fx==2 ? 2.h : 1.75.h
                ),
              ),),
          ),],
        ),
          Column(
            children: [
              const Spacer(),
              Padding(
                padding: EdgeInsets.only(right: 0.5.h, bottom: 0.25.h),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    temp.date,
                    style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: fx==2 ? 2.h :  1.6.h,
                        fontStyle: FontStyle.italic
                    ),
                  ),
                ),
              ),
            ],
          ),
      ],
      ),
    );

}