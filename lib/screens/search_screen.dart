import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:notes_box/Sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:notes_box/models/edit_note_injection.dart';

import '../models/note_model.dart';
import '../services/helper.dart';
import '../styling/colors.dart';
import '../widgets/notes_box.dart';
import '../widgets/small_buttons.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  // String query = "";

  List<Note> resultNotes = [];

  void searchNotes(String searchQuery) {
    final queryLowerCase = searchQuery.toLowerCase();
    List<Note> temp =  db.myNotes.where((note) {
      final titleLowerCase = note.title.toLowerCase();
      final bodyLowerCase = note.body.toLowerCase();
      final dateLowerCase = note.date.toLowerCase();
      return titleLowerCase.contains(queryLowerCase) ||
          bodyLowerCase.contains(queryLowerCase) ||
          dateLowerCase.contains(queryLowerCase);
    }).toList();
    setState(() {
      resultNotes = temp;
    });
  }

  late UserNotesInstance db;
  late EditNoteData editInfo;

  @override
  void initState() {
    db = Get.find();
    editInfo = Get.find();
    super.initState();
  }

  Widget searchBar(){
    return Container(
      padding: EdgeInsets.only(left: 2.5.h, right: 1.h),
      margin: EdgeInsets.symmetric(horizontal: 1.5.h),
      width: double.infinity,
      height: 7.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.5.h),
        color: Colors.grey.withOpacity(0.25),
      ),
      child:
      Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: (query){
                // print(query);
                searchNotes(query);
              },
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search Something...',
                  hintStyle: TextStyle(fontWeight: FontWeight.w300, letterSpacing: 2)
              ),
            ),
          ),
          SizedBox(
              width: 5.5.h,
              height : 5.5.h,
              child: Image.asset('assets/search.png')),
        ],
      ),
    );
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
      ),
      body: Column(
        children: [
          searchBar(),
          SizedBox(height: 5.h),
          Expanded(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.7.h),
                child:
                CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverStaggeredGrid.countBuilder(
                      crossAxisCount: 2,
                      mainAxisSpacing: 0.35.h, // Spacing between rows
                      crossAxisSpacing: 0.35.h, // Spacing between columns
                      staggeredTileBuilder: (int index) =>
                          StaggeredTile.count(tileHelper(index)[0].toInt(), tileHelper(index)[1]),
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                            onTap: (){
                              editInfo.setValue(index_: index, data_: db.myNotes[index]);
                              Get.toNamed('edit-screen');
                            },
                            child: customBox(index, resultNotes[index])); // Build the grid item
                      },
                      itemCount: resultNotes.length,
                    ),
                  ],
                ),
            ),
          ),
        ],
      ),
    );
  }
}
