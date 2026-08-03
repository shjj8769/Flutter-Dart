import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late bool switchColor;  // Switch 상태 
  late String imageName;  // image file name
  late double angle;      // 회전 각도
  late String switchName; // Switch label
  late Timer _timer;      // Timer
  late double _lampSize;   // size

  @override
  void initState() {
    super.initState();
    switchColor = false;
    imageName = 'images/lamp_on.png';
    angle = 0;
    switchName = 'Yellow';
    _lampSize = 225;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {},);

  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    angle = angle > 360 ? 0 : angle;    // setstate가 build에서 적용되므로 조건을 정해줘야함 (360도 넘어가는 조건 초기화)
    _lampSize = _lampSize > 300 ? 150 : _lampSize;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RotationTransition(
              turns: AlwaysStoppedAnimation(angle/360),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 330,
                    width: 400,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          imageName,
                          height: _lampSize,    // boxfit 기본값으로 조정되어있어 width안해도됨, 조정하려면 boxful사용
                        ),
                      ],
                    ),
                  ),
                  Text('apple'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: 
                    () {
                      angle -= 10;
                      setState(() {});
                    }, 
                    child: Text('-10'),
                  ),
                  ElevatedButton(
                    onPressed: 
                    () {
                      angle += 10;
                      setState(() {});
                    }, 
                    child: Text('+10'),
                  ),
                  ElevatedButton(
                    onPressed: reset,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ), 
                    child: Text('Reset'),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  switchName,
                ),
                Switch(
                  value: switchColor, 
                  onChanged: (value) {
                    switchColor = value;
                    _switchAction(value);
                  },
                ),
              ],
            ),
            SizedBox(
              width: 300,
              child: Slider(
                value: angle,
                min: 0,
                max: 360, 
                onChanged: (value) {
                  angle = value;
                  setState(() {});
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: startTimer, 
                  child: Text('Start Timer'),
                ),
                ElevatedButton(
                  onPressed: stopTimer, 
                  child: Text('Stop Timer'),
                ),
              ],
            ),
            SizedBox(
              width: 300,
              child: Slider(
                min: 150,
                max: 300,
                value: _lampSize,
                onChanged: (value) {
                  _lampSize = value;
                  setState(() {});
                },
              ),
            ),
          ],
        ),
      ),
    );
  } // build

  // ------ Function -------
  void reset(){
    angle = 0;
    _lampSize = 225;
    imageName = 'images/lamp_on.png';
    switchName = "Yellow";
    switchColor = false;
    setState(() {});
  }

  void _switchAction(bool value){
    imageName = switchColor ? 'images/lamp_red.png' : 'images/lamp_on.png';
    switchName = switchColor ? "Red" : "Yellow";
    setState(() {});
    }


  void startTimer(){
    _timer.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      angle ++;
      setState(() {});
    },);
  }

  void stopTimer(){
    _timer.cancel();
    reset();
  }


} // class