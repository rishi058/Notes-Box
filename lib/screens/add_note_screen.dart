import 'package:flutter/material.dart';
import 'package:notes_box/Sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:notes_box/models/note_model.dart';
import 'package:notes_box/styling/typography.dart';
import '../controller/user_notes_injection.dart';
import '../services/helper.dart';
import '../styling/colors.dart';
import '../widgets/small_buttons.dart';
import '../widgets/snackbar.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});
  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  TextEditingController title = TextEditingController();
  TextEditingController body = TextEditingController();

  late UserNotesInstance db;

  @override
  void initState() {
    db = Get.find();
    super.initState();
  }

  void saveNote(BuildContext ctx){
    if(title.text.isEmpty && body.text.isEmpty){
      showSnackBar(ctx, 'Note cannot be empty', Colors.grey);
      return;
    }
    Note temp = Note(id_: "", title_: title.text, date_: formatDate() , body_: body.text, color_: randomColor());
    db.add(temp, ctx);
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
                saveNote(context);
              },
                child: saveButton()
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
           Container(
             margin: EdgeInsets.symmetric(horizontal: 2.h),
             child: TextField(
               style: theme(sz: 8),
               controller: title,
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
              child: TextField(
                style: theme(sz: 5),
                controller: body,
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
    );
  }
}
