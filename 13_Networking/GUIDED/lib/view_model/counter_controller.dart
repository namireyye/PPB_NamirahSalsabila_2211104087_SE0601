import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  var counter = 0.obs; 

  void incrementCounter() {
      counter++;
    }

    void decrementCounter() {
      counter--;
    }

    void getSnackbar() {
      Get.snackbar(
        'Get Snacbar',
        'ini Snackbar y',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }

    void getbuttonSheet() {
      Get.bottomSheet(
        Container(
          height: 200,
          color: Colors.green,
          child: const Center(
            child: Text(
              'Ini Bottom Sheet',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
    }
  }

