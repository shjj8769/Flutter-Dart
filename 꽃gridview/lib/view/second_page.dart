import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  // Property
  late String flowerName2;

  @override
  void initState() {
    super.initState();
    flowerName2 = Get.arguments ?? '__';      // null이면 돌아옴
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          flowerName2
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(40),
                child: Image.asset(
                  'images/$flowerName2',
                  width: 300,
                  height: 400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}