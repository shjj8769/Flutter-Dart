import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int currentName;
  late Timer _timer;
  late List<String> nameData;
  late String result;
  
  @override
  void initState() {
    super.initState();
    String  str = "대한민국";
    nameData = str.split("");  //['대','한','민','국' ]
    currentName = 0;
    result = nameData[currentName];
    _timer = Timer.periodic(Duration(seconds: 3), (timer) => currentNames(),);
  }

  @override
  void dispose(){     // App을 종료할 때
    _timer.cancel();  // Timer의 메모리 정리
    super.dispose();  // build의 메모리 정리
  }

  void currentNames(){
    currentName++;
    if(currentName >= nameData.length){
      currentName = 0;
      result = nameData[currentName];
    }else{
      result += nameData[currentName];
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LED 광고'),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              result,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}