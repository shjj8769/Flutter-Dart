import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isFirstClick = true;

  void _showDialog() {
    Get.snackbar(
      '',
      'ElevatedButton is clicked.',
      backgroundColor: _isFirstClick ? Colors.black : Colors.red,
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
      snackPosition: SnackPosition.BOTTOM,
    );

    setState(() {
      _isFirstClick = !_isFirstClick;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Snack Bar'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _showDialog,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.black,
          ),
          child: const Text('Snackbar Button'),
        ),
      ),
    );
  }
}
