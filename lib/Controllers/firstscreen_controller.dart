// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstScreenController extends GetxController {
  late TextEditingController nameTextController;
  late TextEditingController palindromeTextController;

  @override
  void onInit() {
    nameTextController = TextEditingController();
    palindromeTextController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    nameTextController.dispose();
    palindromeTextController.dispose();
    super.onClose();
  }

  void isPalindrom() {
    String result;
    String text = palindromeTextController.text.replaceAll(" ", "");
    if (text == text.split('').reversed.join('')) {
      result = "Is Palindrome";
    } else {
      result = "Not Palindrome";
    }
    Get.defaultDialog(
      title: result,
      textCancel: "Exit",
      middleText: "",
      onCancel: () => Get.back(),
    );
  }
}
