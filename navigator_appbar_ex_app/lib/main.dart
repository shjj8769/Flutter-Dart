import 'package:flutter/material.dart';
import 'package:navigator_appbar_ex_app/sendmail.dart';
import 'package:navigator_appbar_ex_app/view/receivedmail.dart';

import 'view/mail.dart';

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
        '/' :(context) => Mail(),
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
