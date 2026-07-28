import 'package:flutter/material.dart';
import 'package:navigator_appbar_ex_app/sendmail.dart';
import 'package:navigator_appbar_ex_app/view/receivedmail.dart';

class Mail extends StatelessWidget {
  const Mail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text('Navigator_AppBar                   '),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () => mailRoute(context, '/send'),
            icon: Icon(Icons.email),
            ),
          IconButton(
            onPressed: () => mailRoute(context, '/receive'),
            icon: Icon(Icons.email_outlined),
            ),
          ]
        ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => mailRoute(context, '/send'),
              child: Text('보낸 편지함'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
            ),
            ElevatedButton(
              onPressed: () => mailRoute(context, '/receive'),
              child: Text('받은 편지함'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---Functions ---
  // pushname의 위치를 받아 navigator를 사용하는 함수
  void mailRoute(BuildContext context, String route){
    Navigator.pushNamed(context, route);
  }






}