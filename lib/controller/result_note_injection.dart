import 'package:get/get.dart';
import '../models/note_model.dart';


class ResultNotes extends GetxController {
  final RxList<Note> myNotes = <Note>[].obs;

  void updateResult(List<Note> temp){
    myNotes.clear();
    myNotes.addAll(temp);
  }

}