import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_intro_app/second_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("GetX"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Navigation"),
            ElevatedButton( 
              onPressed: () => Get.to(SecondPage()),            // 기존에 사용했던 Navigator , materialPageRoute 사용 X / Get으로 바로 사용
              child: Text("Get.to() : 화면 이동"),               // 여기서 Get
            ),
            ElevatedButton(
              onPressed: () => Get.toNamed('/third'), 
              child: Text("Get.toNamed() : 화면 이동"),
            ),
            Divider(
              thickness: 0.5,
              color: Colors.black,
            ),
            Text("Snack Bar"),
            ElevatedButton(
              onPressed: () => buttonSnack(), 
              child: Text("SnackBar")
            ),
            Divider(
              thickness: 0.5,
              color: Colors.black,
            ),
            Text("Dialog"),
            ElevatedButton(
              onPressed: () => buttonDialog(), 
              child: Text("Dialog")
            ),
            Divider(
              thickness: 0.5,
              color: Colors.black,
            ),
            Text("Bottom Sheet"),
            ElevatedButton(
              onPressed: () => buttonBottomSheet(), 
              child: Text("Bottom Sheet")
            ),
            Divider(
              thickness: 0.5,
              color: Colors.black,
            ),
            Text("Screen Transition"),                             // transition - 효과
            ElevatedButton(
              onPressed: () {
                Get.to(
                  SecondPage(),
                  transition: Transition.downToUp,
                  duration: Duration(seconds: 1)
                );
              }, 
              child: Text('Screen Transition'),
            ),
            ElevatedButton(
              onPressed: () => Get.toNamed('/third2'), 
              child: Text('Screen Transition : Get.toNamed()'),
            ),
            Divider(
              thickness: 0.5,
              color: Colors.black,
            ),
            Text("Navigation & Arguments"),                        // () => fat allow , (){} - 함수 scope
            ElevatedButton(
              onPressed: () => Get.to(
                                    SecondPage(),
                                    arguments: "First"
              ), 
              child: Text('Get.to() : Single Data'),
            ),
            ElevatedButton(
              onPressed: () => Get.to(
                                    SecondPage(),
                                    arguments: ['First', 'Second']
              ), 
              child: Text('Get.to() : Multiple Data'),
            ),
            ElevatedButton(
              onPressed: () async{ 
                var returnValue = await Get.to(SecondPage());     // 기존 SecondPage와 따로 실행 (cpu 2개로 작동)
                Get.snackbar("Return Value", returnValue);
              }, 
              child: Text("Get.to() : Return Argument"),
            ),
          ],
        ),
      ),
    );
  } // build

  // ------------ Function --------------
  void buttonSnack(){       
    Get.snackbar(
      "SnackBar",   // Title
      "Message",    // message
      snackPosition: SnackPosition.TOP,   // 기본값 top , bottom도 있음
      duration: Duration(seconds: 2),
      backgroundColor: Colors.lightGreen,
      colorText: Colors.white
    );
  }

  void buttonDialog(){
    Get.defaultDialog(
      title: 'Dialog',
      middleText: "Message",
      backgroundColor: Colors.amberAccent,
      barrierDismissible: false,
      actions: [
        TextButton(
          onPressed: () => Get.back(), 
          child: Text("Exit")
        ),
      ]
    );
  }

  void buttonBottomSheet(){
    Get.bottomSheet(     // bottomsheet - container로 시작  = drawer랑 동일(child:)
      Container(
        width: 500,
        height: 300,
        color: Colors.amberAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Text Line1"),
            Text("Text Line2"),
            ElevatedButton(
              onPressed: () => Get.back(), 
              child: Text("Exit")
            ),
          ],
        ),
      )
    );
  }
} // class