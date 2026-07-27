import 'package:flutter/material.dart';
import 'package:navigator_app/view/second_page.dart';

class FisrstPage extends StatelessWidget {
  const FisrstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First page"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return SecondPage();
            },));
          }, 
          child: Text('Go to the second page')),
      ),
    );
  }
}