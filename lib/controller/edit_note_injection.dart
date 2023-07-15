import 'package:get/get.dart';
import '../models/note_model.dart';

class EditNoteData extends GetxController {
  RxInt index = 0.obs;
  Rx<Note> data = Note(id_: "", title_: "", date_: "", body_: "", color_: "").obs;

  void setValue({required int index_, required Note data_}){
    index.value = index_;
    data.value = data_;
  }

}