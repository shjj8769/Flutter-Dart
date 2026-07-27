import 'package:flutter/material.dart';
import 'package:navigator_class_app/view/first_page.dart';
import 'package:navigator_class_app/view/second_page.dart';

import 'view/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      routes: {   // 환경설정
        '/' :(context) => Home(),
        '/1st' :(context) {
          return FirstPage();
        },
        '/2nd' :(context) => SecondPage()
      },
      initialRoute: '/',
    );
  }
}
