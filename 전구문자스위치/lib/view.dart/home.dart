import 'package:flutter/material.dart';
import 'package:navigator_lamp_app/util/message.dart';
import 'package:navigator_lamp_app/view.dart/controller.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late TextEditingController textEditingController;   // 글자 입력
  late String lampImage;                              // 이미지 생성

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();  // 객체 생성 (같은 이름으로 다른 객체 만듦)
    lampImage = "images/lamp_on.png";
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
          IconButton(                                 //  AppBar Icon
            onPressed: () {
              Message.contents = textEditingController.text;    // Text를 다음 화면으로 넘김(Message이용)  
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => Controller(), // controller 생성자로 builder 통해 넘어가게 만듦
                ),
              ).then((value) => getData());                                      // Check 뒷 화면까지 진행된 부분
            }, 
            icon: Icon(Icons.edit)
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  labelText: "글자를 입력하세요",
                ),
              ),
            ),  // 리스트 배열에 들어가므로 ,를 사용
            Image.asset(
              lampImage,
              width: 150,
            ),  // 리스트 배열에 들어가므로 ,를 사용
          ],
        ),
      ),
    );
  } // build


  // ------------ Function ----------------
  void getData(){                         // 뒷 화면에서 수정부분을 .then 통해 이후 실행(함수)
    textEditingController.text = Message.contents;
    lampImage = Message.lampStatus ? 'images/lamp_on.png' : 'images/lamp_off.png';
    setState(() {});
  }
} // class