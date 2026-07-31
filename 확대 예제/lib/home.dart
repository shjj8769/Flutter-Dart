import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late String _lampImage;             // Image file name
  late double _lampWidth;             // Image Width
  late double _lampHeight;            // Image height
  late bool _lampSwitch;                  // Switch켜짐 상태
  late bool _sizeSwitch;                  // Switch켜짐 상태


  @override
  void initState() {
    super.initState();
    _lampImage = 'images/lamp_on.png';
    _lampWidth = 150;
    _lampHeight = 300;
    _lampSwitch = true;
    _sizeSwitch = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image확대 및 축소'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 330,
              height: 630,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    _lampImage,
                    width: _lampWidth,
                    height: _lampHeight,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Text(
                      '전구 확대',
                      style: TextStyle(
                        fontSize: 10
                      ),
                    ),
                    Switch(
                      value: _sizeSwitch, 
                      onChanged: (value) {
                        _sizeSwitch = value;
                        sizeOnOff();
                      },
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      '전구 스위치',
                      style: TextStyle(
                        fontSize: 10
                      ),
                    ),
                    Switch(
                      value: _lampSwitch, 
                      onChanged: (value) {
                        _lampSwitch = value;
                        decisionOnOff();
                      },
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  } // build



  // -----Function ------
  void decisionOnOff(){

    _lampImage = _lampSwitch ? 'images/lamp_on.png': 'images/lamp_off.png';
    // if(_lampSwitch){
    //   _lampImage = 'images/lamp_on.png';
    // }else{
    //   _lampImage = 'images/lamp_off.png';
    // }
    setState(() {});
  }
  

  void sizeOnOff(){
    if(_sizeSwitch){            // 현재 이미지가 큰 이미지 일 경우
      _lampWidth = 300;
      _lampHeight = 600;
      _sizeSwitch = true;
    }else{                    // 현재 이미지가 작은 이미지 일 경우
      _lampWidth = 150;
      _lampHeight = 300;
      _sizeSwitch = false;
    }
    setState(() {});
  }
  
} // class