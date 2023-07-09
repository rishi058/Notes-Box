import 'package:flutter/material.dart';
import 'package:notes_box/Sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:notes_box/models/edit_note_injection.dart';
import 'package:notes_box/services/helper.dart';
import 'package:notes_box/styling/typography.dart';
import 'package:notes_box/widgets/empty_box.dart';
import 'package:notes_box/widgets/retry_widget.dart';
import 'package:notes_box/widgets/small_buttons.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../models/note_model.dart';
import '../styling/colors.dart';
import 'drawer_screen.dart';
import '../widgets/notes_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool isLoading = true;

  late UserNotesInstance db;
  late EditNoteData editInfo;

  void setData() async {
    db = Get.find();
    await db.fetch(context).then((value){
      if(value){
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  @override
  void initState() {
    Get.put(UserNotesInstance());
    setData();
    Get.put(EditNoteData());
    editInfo = Get.find();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      drawer: myDrawer(context),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 12.h,
        backgroundColor: CustomColors().black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
                onTap: (){_scaffoldKey.currentState?.openDrawer();},
                child: menuButton()),
            Text('Notes', style: theme(sz: 12, wt: FontWeight.w200)),
            InkWell(
                onTap: (){Get.toNamed('search-screen');},
                child: searchButton())
          ],
        ),
      ),


      body: isLoading ? RetryWidget(onRetry: setData) :
      db.myNotes.isEmpty ? emptyBox()
          : Obx(() =>
          Padding(
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
                        child: customBox(index, db.myNotes[index])); // Build the grid item
                  },
                  itemCount: db.myNotes.length,
                ),
              ],
            )
          ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 1.5.h, right: 0.5.h),
        child: FloatingActionButton(
            tooltip: 'Add a Note',
            backgroundColor: Colors.grey.shade700,
            onPressed: () {
                Get.toNamed('add-screen');
            },
            child: Icon(Icons.add, size: 3.h)),
      ),
    );
  }
}
