import 'package:flutter/material.dart';
import 'package:snackbar_app/snackbar.dart';

class Homeclass extends StatelessWidget {
  const Homeclass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Snack Bar'),
      ),
      body: MySnackBar(),
    );
  }
}