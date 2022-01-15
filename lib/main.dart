import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/first_screen.dart';
import 'pages/second_screen.dart';
import 'pages/third_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Suitmedia',
      initialRoute: FirstScreen.routeName,
      routes: {
        FirstScreen.routeName: (context) => FirstScreen(),
        SecondScreen.routeName: (context) => SecondScreen(),
        ThirdScreen.routeName: (context) => ThirdScreen(),
      },
    );
  }
}
