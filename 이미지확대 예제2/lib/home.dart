import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String _lampImage;             // Image file name
  late double _lampWidth;             // Image Width
  late double _lampHeight;            // Image height
  late String _lampColorText;              // lamp 색 text
  late String _lampSizeText;              // lamp 크기 text
  late String _lampSwitchText;              // lamp 스위치 text
  late bool _lampSwitch;                  // Switch켜짐 상태
  late bool _sizeSwitch;                  // Switch켜짐 상태
  late bool _colorSwitch;                  // Switch켜짐 상태

  @override
  void initState() {
    super.initState();
    _lampImage = 'images/lamp_on.png';
    _lampWidth = 300;
    _lampHeight = 600;
    _lampColorText = "전구 색깔";
    _lampSizeText = "전구 확대";
    _lampSwitchText = "전구 스위치";
    _lampSwitch = true;
    _sizeSwitch = true;
    _colorSwitch = true;
  }  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image 확대 및 축소'),
        centerTitle: true,
        backgroundColor: Colors.green,
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
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(                               // 전구 색깔
                        _lampColorText,
                        style: TextStyle(
                          fontSize: 10
                        ),
                      ),
                      Switch(                             // 전구 색 스위치
                        value: _colorSwitch, 
                        onChanged: (value) {
                          _colorSwitch = value;
                          colorOnOff();
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  
                      Text(                               // 전구 확대
                        _lampSizeText,
                        style: TextStyle(
                          fontSize: 10
                        ),
                      ),
                      Switch(                             // 전구 확대 스위치
                        value: _sizeSwitch, 
                        onChanged: (value) {
                            _sizeSwitch = value;
                            sizeOnOff();
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(                               // 전구 OnOff
                        _lampSwitchText,
                        style: TextStyle(
                          fontSize: 10
                        ),
                      ),
                      Switch(                             // 전구 OnOff스위치
                        value: _lampSwitch, 
                        onChanged: (value) {
                          _lampSwitch = value;
                          _lampOnOff();
                        },
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  } // build

  void colorOnOff(){          // 전구 색 스위치 함수
  if(_lampSwitch){
    _lampImage = _colorSwitch ? 'images/lamp_red.png': 'images/lamp_on.png';
    _lampColorText = _colorSwitch ? '빨간색' : '노란색';
  }
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
    _lampSizeText = _sizeSwitch ? "커짐" : "작아짐";
    setState(() {});
  }

  void _lampOnOff(){
   _lampImage = _lampSwitch ? 'images/lamp_on.png': 'images/lamp_off.png';
   _lampSwitchText = _lampSwitch ? "켜짐" : "꺼짐";
   if(_lampSwitch == false){
    _lampImage = 'images/lamp_off.png';
   }
 
   setState(() {});
  }
} // class