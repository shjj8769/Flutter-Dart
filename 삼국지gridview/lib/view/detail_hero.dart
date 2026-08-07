import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailHero extends StatefulWidget {
  const DetailHero({super.key});

  @override
  State<DetailHero> createState() => _DetailHeroState();
}

class _DetailHeroState extends State<DetailHero> {
  // Property
  late String heroName;

  @override
  void initState() {
    super.initState();
    heroName = Get.arguments ?? '__';     // null 이면 __들어옴
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('인물 보기'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(heroName)
          ],
        ),
      ),
    );
  }
}