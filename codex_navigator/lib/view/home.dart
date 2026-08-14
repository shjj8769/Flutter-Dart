import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'firstpage.dart';
import 'secondpage.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Main Screen')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () => Get.to(() => const FirstPage()),
              child: const Text('Go to the screen #1'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Get.to(() => const SecondPage()),
              child: const Text('Go to the screen #2'),
            ),
          ],
        ),
      ),
    );
  }
}
