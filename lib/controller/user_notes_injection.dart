import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_box/services/pair.dart';
import '../models/note_model.dart';
import '../services/database.dart';
import '../widgets/snackbar.dart';

class UserNotesInstance extends GetxController {
  final RxList<Note> myNotes = <Note>[].obs;

  Future<bool> fetch (BuildContext ctx) async {
    Pair<bool, List<Note>> val = await Database().fetchNotes(ctx);
    myNotes.clear();
    myNotes.addAll(val.second);
    return val.first;
  }

  void add(Note temp, BuildContext ctx){
    Database().addNote(temp).then((value) {
      if(value){
        showSnackBar(ctx, 'Note Added Successfully', Colors.grey);
        myNotes.add(temp);
        Get.toNamed('home-screen');
      }
      else{
        showSnackBar(ctx, 'Something Went Wrong! Try Again.', Colors.redAccent);
      }
    });
  }

  void delete(String noteId, int index, BuildContext ctx){
    Database().deleteNote(noteId).then((value) {
      if(value){
        showSnackBar(ctx, 'Note Deleted Successfully', Colors.grey);
        myNotes.removeAt(index);
        Get.toNamed('home-screen');
      }
      else{
        showSnackBar(ctx, 'Something Went Wrong! Try Again.', Colors.redAccent);
      }
    });
  }

  void modify(Note temp, int index, BuildContext ctx){
    Database().updateNote(temp).then((value) {
      if(value){
        showSnackBar(ctx, 'Note Updated Successfully', Colors.grey);
        myNotes[index] = temp;
        Get.toNamed('home-screen');
      }
      else{
        showSnackBar(ctx, 'Something Went Wrong! Try Again.', Colors.redAccent);
      }
    });
  }

}