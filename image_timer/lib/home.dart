import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late List<String> imagesFile; // 이미지 파일이름
  late int currentPage; // 리스트 순서
  late Timer _timer;


  @override
  void initState() {
    super.initState();
    imagesFile = [
      'flower_01.png',
      'flower_02.png',
      'flower_03.png',
      'flower_04.png',
      'flower_05.png',
      'flower_06.png',
    ];
    currentPage = 0;

    // Timer 설치
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      changeImage();
    },);
  }
    @override
    void dispose(){ // App을 종료할 때
    _timer.cancel();  // Timer의 메모리 정리
    super.dispose();  // build의 메모리 정리
  }

  // -------- Function ---------

  void changeImage(){
    currentPage ++;
    if(currentPage >= imagesFile.length){
      currentPage = 0;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('3초마다 이미지 무한 반복'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              imagesFile[currentPage],
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(20),
                child: Image.asset(
                  'images/${imagesFile[currentPage]}',
                  width: 400,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  } // Build



} // Class