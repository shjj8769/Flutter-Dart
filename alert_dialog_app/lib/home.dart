import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Dialog with Gesture'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => _showDialog(context),
          child: Text(
            'Hello World'
          ),
        ),
      ),
    );
  }


  void _showDialog(BuildContext context){
    showDialog(
      context: context, 
      barrierDismissible: false,
      barrierColor: Colors.red[100],
      builder: (context) {
        return AlertDialog(
          title: Text('Alert Title'),
          content: Text("Hello World를 \n Touch 했습니다."),
          actions: [
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                }, 
                child: Text('종료')
              ),
            )
          ],
        );
      },
    );
  }
}