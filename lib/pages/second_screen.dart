import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:suitmedia_km/Controllers/secondscreen_controller.dart';
import 'package:suitmedia_km/widgets/custom_button.dart';

class SecondScreen extends StatelessWidget {
  final secondC = Get.put(SecondScreenController());
  static const routeName = "/second_screen";
  SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "SecondScreen",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Welcome"),
            Obx(
              () => Text(
                secondC.user.value,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 4,
            ),
            Center(
              child: Column(
                children: [
                  Obx(() {
                    if (secondC.selected.value == "") {
                      return Text("Selected Username",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold));
                    } else {
                      return Text(
                        secondC.selected.value,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      );
                    }
                  }),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 2.5,
                  ),
                  CustomButton(
                    label: "Choose a User",
                    onPressed: () {
                      Get.toNamed("/third_screen");
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
