import 'package:drawer_app/receivedmail.dart';
import 'package:drawer_app/sendmail.dart';
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
      routes: {   // 환경설정
        '/' :(context) => Home(),
        '/send' :(context) {
          return Sendmail();
        },
        '/receive' :(context) {
          return Receivedmail();
        },
      },
      initialRoute: '/',
    );
  }
}
