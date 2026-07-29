import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late String buttonText;  // 버튼의 누름 저장
  late bool buttonState;   // 버튼의 횟수 판단
  @override
  void initState() {
    super.initState();
    buttonText = "OFF";
    buttonState = false;
    print("------------ iniState()를 구동했습니다.");
  }

  @override
  Widget build(BuildContext context) {
    print("------------ build()를 구동했습니다.");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Flutter Life Cycle'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _onClick(),
              child: Text('버튼을 누르세요.')
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "버튼상태 : $buttonText"
              ),
            ),
          ],
        ),
      ),
    );
  } // build

  // void _onClick() {
  // print("------------ onClick()를 구동했습니다.");
  // if(buttonState == false){
  //    buttonText = "ON";
  //   buttonState = true;
  // }else{
  //   buttonText = "OFF";
  //   buttonState = false;
  // }
  // setState(() {});
  // }


  // ----- Function -----
  // -----------------------------------------------
  // Date :
  // Desc : 버튼 상태를 OFF와 ON을 Toggle한다.
  // Author
  // -----------------------------------------------

  void _onClick() {
    print("------------ onClick()를 구동했습니다.");
    if(buttonState == false){
      buttonText = "ON";
      buttonState = true;
    }else{
      buttonText = "OFF";
      buttonState = false;
    }
    setState(() {});
  }



} // class