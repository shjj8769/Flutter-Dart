import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  String currentDateTime = "";
  late DateTime chosenDateTime;
  final bool _isRunning = true;

  @override               // DatePicker 중요!!!! 
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      if(!_isRunning){    // false일때 작동
        timer.cancel();   // dispose를 사용 안해도 됨. 여기서 끝
      }
      _addItem();
      setState(() {});
    },);
  }

  void _addItem(){
    final DateTime now = DateTime.now();
    currentDateTime = "${now.year} - ${now.month.toString().padLeft(2, '0')} -"
    " ${now.day.toString().padLeft(2, '0')} ${_weekDayToString(now.weekday)} "
    "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";
  }


  String _weekDayToString(int weekday){
    String dateName = "";

    switch(weekday){
      case 1:
      dateName = "월";
      case 2:
      dateName = "화";
      case 3:
      dateName = "수";
      case 4:
      dateName = "목";
      case 5:
      dateName = "금";
      case 6:
      dateName = "토";
      case 7: //(=default)
      dateName = "일";
      
    }
    return dateName;  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date Picker Example2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "현재 시간 : $currentDateTime",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}