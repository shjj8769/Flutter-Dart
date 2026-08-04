import 'package:flutter/material.dart';
import 'package:textfield_login_data_app/second.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //  Property
  late TextEditingController userIdController;
  late TextEditingController userPasswordController;

  @override
  void initState() {
    super.initState();
    userIdController = TextEditingController();           // userIdController - 생성자로 만든 Object 객체임
    userPasswordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log In'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: userIdController,
              decoration: InputDecoration(
                labelText: "ID를 입력하세요"
              ),
            ),
            TextField(
              controller: userPasswordController,
              decoration: InputDecoration(
                labelText: "패스워드를 입력하세요"
              ),
              obscureText: true,          // 텍스트가 안보이게 나타남
            ),
            ElevatedButton(
              onPressed: _checkData, 
              child: Text("Log In")
            ),
          ],
        ),
      ),
    );
  } // build

  // ---------- Function ------------
  void _checkData(){
    if(userIdController.text.trim().isNotEmpty && userPasswordController.text.trim().isNotEmpty){
      if(userIdController.text.trim() == "apple" && userPasswordController.text.trim() == "4321"){
        _showDialog();
      }else{
        checkSnackBar();
      }
    }else{
      errorSnackBar();
    }
  }

  void errorSnackBar(){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("사용자 ID와 암호를 입력하세요"),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      )
    );
  }


  void checkSnackBar(){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("사용자 ID와 암호가 일치하지 않습니다"),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.blue,
      )
    );
  }

  void _showDialog(){
    showDialog(
      context: context, 
      builder: (context) {
        return AlertDialog(
          title: Text("환영합니다."),
          content: Text("신분이 확인되었습니다."),
          actions: [
            TextButton(
              onPressed: () {
                String id = userIdController.text.toString();
                userIdController.text = "";
                userPasswordController.text = "";
                Navigator.of(context).pop();

                Navigator.push(
                  context, 
                  MaterialPageRoute(                // 다음 페이지 만드는 부분
                    builder: (context) {
                      return Second(id: id);        // second페이지 final 함수 만든 것 지정한 이름 넣어줌
                      
                    },
                  ),
                );
              }, 
              child: Text("OK")
            ),
          ],
        );
      },
    );
  }
} // class