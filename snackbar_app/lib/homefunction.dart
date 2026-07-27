import 'package:flutter/material.dart';

class Homefunction extends StatelessWidget {
  const Homefunction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Snack Bar'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => snackBarFunction(context),
          child: Text(
            'Snack Bar Button'
          ),
        ),
      ),
    );
  }  // build


  // ---- Function ----
  void snackBarFunction(BuildContext context){
   ScaffoldMessenger.of(context).showSnackBar(
     SnackBar(
        content: Text('Elevated Button is clicked.'),
        backgroundColor: Colors.pink,
        duration: Duration(seconds: 2),
      ),
    );
  }

}

/*
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Elevated Button is clicked.'),
                backgroundColor: Colors.red,
                duration: Duration(seconds: 2),
              ),
            );
*/