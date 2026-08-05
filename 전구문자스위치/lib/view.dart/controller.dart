import 'package:flutter/material.dart';
import 'package:navigator_lamp_app/util/message.dart';

class Controller extends StatefulWidget {
  const Controller({super.key});

  @override
  State<Controller> createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {        // 움직이면서 수정 - editor
  
  // Propert
  late TextEditingController textEditingController;
  late String switchLabel;
  late bool switchValue;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    textEditingController.text = Message.contents;        // 앞 화면에 데이터 받아오기

    if(Message.lampStatus){
      switchLabel = "ON";
      switchValue = true;
    }else{
      switchLabel = "OFF";
      switchValue = false;
    }
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
            TextField(
              controller: textEditingController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  switchLabel,
                ),
                Switch(
                  value: switchValue,                 // 화면에 보여지는 value
                  onChanged: (value) {                // 사용자가 바꾸는 value
                    switchValue = value;
                    switchLabel = switchValue ? "ON" : "OFF";
                    setState(() {});
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: () {
                  Message.contents = textEditingController.text;
                  Message.lampStatus = switchValue;
                  Navigator.pop(context);
                }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(5)
                  ),
                ),
                child: Text("OK")
              ),
            ),
          ],
        ),
      ),
    );
  }
}