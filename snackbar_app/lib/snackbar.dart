import 'package:flutter/material.dart';

class MySnackBar extends StatelessWidget {
  const MySnackBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Elevated Button is clicked.'),
                backgroundColor: Colors.pink,
                duration: Duration(seconds: 2),
              ),
            );
          },
          child: Text(
            'Snack Bar Button'
          ),
      ),
    );    
  }
}