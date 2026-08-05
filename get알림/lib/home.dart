import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Action Sheet'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => actionSheet(),
              child: Text('Action Sheet')
            ),
          ],
        ),
      ),
    );
  } // build

  // ------------- Function ----------------
  void actionSheet(){
    showCupertinoModalPopup(      // 아래에서 위로 올라오는 함수
      context: context, 
      barrierDismissible: false,
      builder: (context) => CupertinoActionSheet(
        title: Text("Message"),
        actions: [
          Divider(
            thickness: 0.5,
            color: Colors.black,
          ),
          CupertinoActionSheetAction(           // 버튼
            onPressed: () {
              print("action is pressed");
              Get.back();
            }, 
            child: Text('Action')
          ),
          Divider(
            thickness: 0.5,
            color: Colors.black,
          ),
          ElevatedButton(
            onPressed: () {
              Get.back();
            }, 
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(10)
              )
            ),
            child: Text('버튼')
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Get.back(), 
          child: Text('Cancel')
        ),
      ),
    );
  }



} // class