import 'package:flutter/material.dart';
import 'package:gestorage_app/second_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //  Property
  late TextEditingController userIdController;    // 사용자 ID
  late TextEditingController passwordController;  // 패스워드
  final box = GetStorage();     // <<<<<<<<<<< GetStorage 생성

  @override
  void initState() {
    super.initState();
    userIdController = TextEditingController();
    passwordController = TextEditingController();
    // 초기화(GetStorage)
    initStorage();
  }

  void initStorage(){
    box.write('p_userId', "");    // 초기라 데이터 값은 ""
    box.write('p_password', "");
  }

  @override
  void dispose() {
    disposeStorage();
    super.dispose();
  }

  void disposeStorage(){
    box.erase();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log In'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: userIdController,
              decoration: InputDecoration(
                labelText: '사용자 ID를 입력하세요.',
              ),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: '패스워드를 입력하세요.',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if(userIdController.text.trim().isEmpty || passwordController.text.trim().isEmpty){
                  errorSnackBar();
                }else{
                  _showDialog();
                }
              }, 
              child: Text('Log In')
            ),
          ],
        ),
      ),
    );
  } // build


  // --------- Function ------------

  void errorSnackBar(){
    //
  }

  void _showDialog(){
    Get.defaultDialog(
      title: '환영합니다.',
      middleText: '확인 되었습니다.',
      barrierDismissible: false,    // 주변 클릭 반응 x
      actions: [
        TextButton(
          onPressed: () {
            saveStorage();
            Get.back();
            Get.to(SecondPage());
          }, 
          child: Text('Exit')
        ),
      ]
    );
  }

  void saveStorage(){
    box.write('p_userId', userIdController.text.trim());
    box.write('p_password', passwordController.text.trim());
  }
} // class