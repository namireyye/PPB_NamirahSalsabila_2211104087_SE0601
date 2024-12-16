// Main entry file
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/home_page.dart';
import 'controllers/note_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Initialize NoteController at the start
    Get.put(NoteController());

    return GetMaterialApp(
      title: 'Simple Notes App',
      home: MyHomePage(),
    );
  }
}
