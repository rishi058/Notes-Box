import 'package:flutter/material.dart';
import 'package:notes_box/Sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:notes_box/controller/edit_note_injection.dart';
import 'package:notes_box/models/note_model.dart';
import 'package:notes_box/styling/typography.dart';
import 'package:notes_box/widgets/delete_dialog.dart';
import 'package:notes_box/widgets/snackbar.dart';
import '../controller/user_notes_injection.dart';
import '../services/helper.dart';
import '../styling/colors.dart';
import '../widgets/small_buttons.dart';

class EditNote extends StatefulWidget {
  const EditNote({super.key});
  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  TextEditingController title = TextEditingController();
  TextEditingController body = TextEditingController();

  late UserNotesInstance db;
  late EditNoteData note;

  void setData(){
    title.text = note.data.value.title;
    body.text = note.data.value.body;
  }

  @override
  void initState() {
    db = Get.find();
    note = Get.find();
    setData();
    super.initState();
  }

  void updateNote(BuildContext ctx){
    if(title.text.isEmpty || body.text.isEmpty){
      showSnackBar(ctx, 'Note cannot be empty', Colors.grey);
      return;
    }
    Note temp = Note(id_: note.data.value.id, title_: title.text, date_: formatDate() , body_: body.text, color_: randomColor());
    db.modify(temp, note.index.value, ctx);
  }

  @override
  void dispose() {
    title.dispose();
    body.dispose();
    super.dispose();
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
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 2.h),
            child: InkWell(
                onTap: (){
                  updateNote(context);
                },
                child: updateButton()
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 2.h),
              child: TextField(
                style: theme(sz: 9),
                controller: title,
                textAlign: TextAlign.left,
                minLines: 1,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    hintText: 'Title',
                    border: InputBorder.none,
                    hintStyle: theme(sz: 10, wt: FontWeight.w300, clr: Colors.white70.withOpacity(0.5), sp: 2)
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 2.h),
              child: Text(note.data.value.date, style: theme(sz: 4,  st: FontStyle.italic, clr: Colors.grey),),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 2.h),
              child: TextField(
                style: theme(sz: 5.5),
                controller: body,
                textAlign: TextAlign.left,
                minLines: 2,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    hintText: 'Type Something...',
                    border: InputBorder.none,
                    hintStyle: theme(sz: 5, wt: FontWeight.w300, clr: Colors.white70.withOpacity(0.5))
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 1.5.h, right: 0.5.h),
        child: FloatingActionButton(
            tooltip: 'Delete Note',
            backgroundColor: Colors.grey.shade700,
            onPressed: () {
              showAlert(context).then((value) {
                if(value){
                  db.delete(note.data.value.id, note.index.value, context);
                }
              });
            },
            child: Icon(Icons.delete, size: 2.5.h)),
      ),
    );
  }
}
