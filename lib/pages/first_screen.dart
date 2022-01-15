import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia_km/Controllers/secondscreen_controller.dart';
import '../Controllers/firstscreen_controller.dart';
import '../widgets/custom_button.dart';

class FirstScreen extends StatelessWidget {
  static const routeName = "/first_screen";
  final homeC = Get.put(FirstScreenController());
  final secondC = Get.put(SecondScreenController());

  FirstScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 8,
                    child: Image.asset('assets/images/btn_add_photo .png'),
                  ),
                  SizedBox(height: 58),
                  NameField(),
                  SizedBox(height: 22),
                  PalindromeField(),
                  SizedBox(height: 45),
                  CustomButton(
                    label: "CHECK",
                    onPressed: () {
                      homeC.isPalindrom();
                    },
                  ),
                  SizedBox(height: 22),
                  CustomButton(
                    label: "NEXT",
                    onPressed: () {
                      secondC.changeUsername(homeC.nameTextController.text);
                      Get.toNamed("/second_screen");
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PalindromeField extends StatelessWidget {
  final homeC = Get.put(FirstScreenController());
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: homeC.palindromeTextController,
      autocorrect: false,
      enableSuggestions: false,
      decoration: InputDecoration(
        hintText: 'Palindrome',
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

class NameField extends StatelessWidget {
  final homeC = Get.put(FirstScreenController());

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: homeC.nameTextController,
      autocorrect: false,
      enableSuggestions: false,
      decoration: InputDecoration(
        hintText: 'Name',
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
