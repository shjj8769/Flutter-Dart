import 'package:flutter/material.dart';
import 'package:navigator_lamp_switch_app/util/message.dart';
import 'package:navigator_lamp_switch_app/view/controller.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // Property
  late String lampName;                              // 전구 생성

  @override
  void initState() {
    super.initState();
    lampName = 'images/lamp_on.png';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main 화면"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => Controller(),
                ),
              ).then((value) => getData(),);        // 뒷 페이지 내용을 추가적으로 사용
            }, 
            icon: Icon(Icons.edit)
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              lampName,
              width: 150,
            ),
          ],
        ),
      ),
    );
  } // build


  // ---------- Function ----------
  void getData(){
    if(Message.lampState == false){                 // lamp OnOff스위치
      lampName = 'images/lamp_off.png';
    }else{
      if(Message.lampStatus == false){                       // lamp color스위치
        lampName = 'images/lamp_on.png';
      }else{
        lampName = 'images/lamp_red.png';
      }
    }
    setState(() {});
  }
} // class