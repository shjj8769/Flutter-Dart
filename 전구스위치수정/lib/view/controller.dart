import 'package:flutter/material.dart';
import 'package:navigator_lamp_switch_app/util/message.dart';

class Controller extends StatefulWidget {
  const Controller({super.key});

  @override
  State<Controller> createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {
  //  Property
  late String lampColorController;          // lamp 색 글자 변경
  late String lampOnOffController;          // lamp OnOff 글자 변경
  late bool lampColor;                      // lamp 색 스위치
  late bool lampOnOff;

  @override
  void initState() {
    super.initState();
    lampColorController = "Red";
    lampOnOffController = "off";
    lampColor = false;
    lampOnOff = false;

    lampColorController = Message.lampStatus ? "Red" : "Yellow";  // 색깔 구분
    lampColor = Message.lampStatus ? true : false;                // 색깔 스위치 상태
    lampOnOffController = Message.lampState ? "ON" : "OFF";       // OnOff 구분
    lampOnOff = Message.lampState ? true : false;                 // OnOff 스위치 상태
    // if(Message.lampStatus){                 // lamp 색
    //   lampColorController = "Red";
    //   lampColor = true;
    // }else{
    //   lampColorController = "Yellow";
    //   lampColor = false;
    // }
    // if(Message.lampState){                 // lamp OnOff 상태
    //   lampOnOffController = "ON";
    //   lampOnOff = true;
    // }else{
    //   lampOnOffController = "OFF";
    //   lampOnOff = false;
    // }
    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("수정화면"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(lampColorController),
                Switch(
                  value: lampColor, 
                  onChanged: (value) {
                    lampColor = value;
                    lampColorController = lampColor ? "Red" : "Yellow";
                    setState(() {});
                  },
                ),
              ],
            ),    // 첫 번째 스위치
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(lampOnOffController),
                Switch(
                  value: lampOnOff, 
                  onChanged: (value) {
                    lampOnOff = value;
                    lampOnOffController = lampOnOff ? "ON" : "OFF";
                    setState(() {});
                  },
                ),
              ],
            ),     // 두 번째 스위치
            ElevatedButton(
              onPressed: () {
                Message.lampState = lampOnOff;
                Message.lampStatus = lampColor;
                Navigator.pop(context);
              }, 
              child: Text("OK")
            ),
          ],
        ),
      ),
    );
  }
}