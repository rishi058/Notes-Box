import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_box/services/pair.dart';
import '../services/database.dart';
import '../widgets/snackbar.dart';

class Note{
  String id = "";
  String title = "";
  String date = "";
  String body = "";
  String color = "";

  Note({required String id_, required String title_, required String date_, required String body_, required String color_}){
    id = id_;
    title = title_;
    date = date_;
    body = body_;
    color = color_;
  }
}



