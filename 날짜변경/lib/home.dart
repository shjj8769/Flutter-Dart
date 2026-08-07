import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  String currentDateTime = "";
  DateTime? chosenDateTime;
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
    final DateTime now = DateTime.now();      // os가 주는 것 (class DateTime 함수 now에)
    currentDateTime = "${now.year} - ${now.month.toString().padLeft(2, '0')} -"
    " ${now.day.toString().padLeft(2, '0')} ${_weekDayToString(now.weekday)} "    // <- 숫자로 만들어진것을 toString으로 함수 만들어 요일 설정
    "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";  // << 숫자를 String한 것 (숫자는 우측정렬) '0' - 빈 값은 0으로 넣겠다.
    setState(() {});
    
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
    return dateName;  // 반환 타입은 String으로 타입 맞춰줘야함
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
            SizedBox(
              width: 300,
              height: 200,
              child: CupertinoDatePicker(       // 날짜 변경했을 때 실행
                initialDateTime: DateTime.now(),    // 초기 시간 addItem에 설정해 둔 값 (DateTime.now())
                use24hFormat: true,             // 24시간
                onDateTimeChanged: (value) {
                  chosenDateTime = value;       //
                  setState(() {});
                },
              ),
            ),
            Text(
              '선택 시간 :  ${chosenDateTime != null ? _chosenItem(chosenDateTime!) : "시간을 선택 하세요"}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  } // build



  // ----------- Function -----------------
  String _chosenItem(DateTime now1){            // 선택한 시간
    String chosenDateTime1 = "${now1.year} - ${now1.month.toString().padLeft(2, '0')} -"
      " ${now1.day.toString().padLeft(2, '0')} ${_weekDayToString(now1.weekday)} "    // <- 숫자로 만들어진것을 toString으로 함수 만들어 요일 설정
      "${now1.hour.toString().padLeft(2, '0')}:${now1.minute.toString().padLeft(2, '0')}";

  
  return chosenDateTime1; 
  
  }
  
} // class