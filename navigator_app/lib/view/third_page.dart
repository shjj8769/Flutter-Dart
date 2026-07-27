import 'package:flutter/material.dart';
import 'package:navigator_app/view/first_page.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('third page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  }, 
                  child: Text('Go th second page')),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                  return FisrstPage();
                  },));
                 }, 
                  child: Text('Go to first Page')),
            ],
            ),
          ],
        ),
      ),
    );
  }
}