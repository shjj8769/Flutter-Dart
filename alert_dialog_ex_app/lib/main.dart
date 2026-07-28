import 'package:alert_dialog_ex_app/second_page.dart';
import 'package:flutter/material.dart';

import 'home.dart';

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
      routes: {
        '/' :(context) => Home(),
        '/2nd' :(context) {
          return SecondPage();
        },
      },
      initialRoute: '/',
    );
  }
}

