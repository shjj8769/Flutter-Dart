import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  // Property
  late String lampName;                           // 전구 이미지
  late bool lampSwitch;                           // 전구 상태

  @override
  void initState() {
    super.initState();
    lampName = 'images/lamp_on.png';
    lampSwitch = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert를 이용한 메세지 출력'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Image.asset(
                lampName,
                width: 300,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: _showDialog,
                    child: Text('켜기'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blue,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: _showOffDialog,
                    child: Text('끄기'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blue,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  } // build


  // ----------- Function -------------
  void _showDialog(){
    if(lampSwitch){
      showDialog(
        context: context, 
        builder: (context) {
          return AlertDialog(
            title: Center(
              child: Text('경고'),
            ),
            content: Text(
              '현재 램프가 켜진 상태입니다.',
              textAlign: TextAlign.center,
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                Get.back();
                }, 
                child: Center(
                  child: Text('네 알겠습니다.'),
                ),
              ),
            ],
          );
        },
      );
    }else{
      showCupertinoModalPopup(
        context: context, 
        builder: (context) => CupertinoActionSheet(
          title: Text('램프 켜기 \n\n 램프를 켜시겠습니까?'),
          actions: [
            Divider(
              thickness: 0.5,
              color: Colors.black,
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                lampName = 'images/lamp_on.png';
                lampSwitch = true;
                setState(() {});
                Get.back();
              }, 
              child: Text('예')
            ),
            Divider(
              thickness: 0.5,
              color: Colors.black,
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                Get.back();
              }, 
              child: Text('아니오')
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: () => Get.back(), 
            child: Text('Cancel'),
          ),
        ),
      );
    }
  }

  void _showOffDialog(){
    if(lampSwitch == false){
      showDialog(
        context: context, 
        builder: (context) {
          return AlertDialog(
            title: Center(
              child: Text('경고'),
            ),
            content: Text(
              '현재 램프가 꺼진 상태입니다.',
              textAlign: TextAlign.center,
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                Get.back();
                }, 
                child: Center(
                  child: Text('네 알겠습니다.'),
                ),
              ),
            ],
          );
        },
      );
    }else{
      showCupertinoModalPopup(
        context: context, 
        builder: (context) => CupertinoActionSheet(
          title: Text('램프 끄기 \n\n 램프를 끄시겠습니까?'),
          actions: [
            Divider(
              thickness: 0.5,
              color: Colors.black,
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                lampName = 'images/lamp_off.png';
                lampSwitch = false;
                setState(() {});
                Get.back();
              }, 
              child: Text('예')
            ),
            Divider(
              thickness: 0.5,
              color: Colors.black,
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                Get.back();
              }, 
              child: Text('아니오')
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: () => Get.back(), 
            child: Text('Cancel'),
          ),
        ),
      );
    }
  }
} // class