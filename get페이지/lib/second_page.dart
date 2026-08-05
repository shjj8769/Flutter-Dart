import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  // Property
  var value = Get.arguments ?? "__";                    // null값이면 __ 지정한 value에 할당 됨(null값 사용 X)


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Get.back(),              // Get.back() 이전 화면 돌아가기 
              child: Text("Exit")
            ),
            Text(
              "Single Argument : $value"                // value 위에 할당되는 값을 출력 (home에 'First')
            ),
            Text(
              "Multiple Argument #1 : ${value[0]}",
            ),
            Text(
              "Multiple Argument #2 : ${value[1]}",
            ),
            ElevatedButton(
              onPressed: () => Get.back(result: "여 브 세 여 ~~"), 
              child: Text('Reply'),
            ),
          ],
        ),
      ),
    );
  }
}