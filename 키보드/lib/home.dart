import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Key Board Enter'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextField(
            controller: textController,
            decoration: InputDecoration(
              labelText: '글자를 입력하세요.'
            ),
            textInputAction: TextInputAction.go,      // <- onPress기능과 동일
            onSubmitted: (value) {
              if(textController.text.trim() == '' || textController.text.trim().isEmpty){
                errorSnackBar();
              }else{
                showSnackBar();
              }
            },
          ),
        ],
      ),
    );
  } // build

  // --------- Function --------------
  void errorSnackBar(){
    Get.snackbar(
      "경고", 
      "글자를 입력 하세요.",
      backgroundColor: Colors.brown[600],
    );
  }

  void showSnackBar(){
    Get.snackbar(
      "입력 완료", 
      "입력한 글자는 ${textController.text.trim()} 입니다",
      backgroundColor: Colors.brown[900],
    );
  }
} // class