import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes_box/services/pair.dart';
import 'package:notes_box/widgets/snackbar.dart';
import '../models/note_model.dart';

class Database{

  final String userId = FirebaseAuth.instance.currentUser!.uid;

  Future<bool> addNote(Note temp) async {
    bool global = false;
    final CollectionReference myNotes = FirebaseFirestore.instance.collection(userId);
    try{
      final DocumentReference docRef =
      await myNotes.add({
        'title' : temp.title,
        'date' : temp.date,
        'body' : temp.body,
        'color' : temp.color,
      });

      String id = docRef.id;

      try{
        myNotes.doc(id).update({
          'id' : id,
        });
      }
      catch(e){
        global = false;
      }

      global = true;
    }
    catch(e){
      global = false;
    }

    return global;

  }

  Future<bool> deleteNote(String noteId) async {
    final CollectionReference myNotes = FirebaseFirestore.instance.collection(userId);
    try{
      myNotes.doc(noteId).delete();
      return true;
    }
    catch(e){
      return false;
    }
  }

  Future<bool> updateNote(Note temp) async {
    final CollectionReference myNotes = FirebaseFirestore.instance.collection(userId);
    try{
      String id = temp.id;
      myNotes.doc(id).update({
        'title': temp.title,
        'date' : temp.date,
        'color' : temp.color,
        'body' : temp.body,
      });
      return true;
    }
    catch(e){
      print(e.toString());
      return false;
    }
  }


  Future<Pair<bool, List<Note>>> fetchNotes(BuildContext ctx) async {
    List<Note> res = [];
    final CollectionReference myNotes = FirebaseFirestore.instance.collection(userId);
    QuerySnapshot querySnapshot;

    try{
      querySnapshot = await myNotes.get();
    }
    catch (e){
      showSnackBar(ctx, 'Something Went Wrong! Unable to fetch.', Colors.redAccent);
      return const Pair<bool, List<Note>>(false, []);
    }

    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    for(int i=0; i<allData.length; i++){
      Map<String, dynamic> note = allData[i] as Map<String, dynamic>;
      if(note['id']==null){continue;}
      Note temp = Note(id_: note['id'], title_: note['title'], date_: note['date'], body_: note['body'], color_: note['color']);
      res.add(temp);
    }
    return Pair<bool, List<Note>>(true, res);

  }

}