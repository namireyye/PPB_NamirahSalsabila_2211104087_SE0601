import 'package:get/get.dart';
import '../models/note.dart';

class NoteController extends GetxController {
  var notes = <Note>[].obs;

  void addNote(String title, String description) {
    notes.add(Note(title: title, description: description));
  }

  void deleteNoteAt(int index) {
    notes.removeAt(index);
  }
}
