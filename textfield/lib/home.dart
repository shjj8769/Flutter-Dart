import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late TextEditingController textEditingController;
  late TextEditingController num1EditingController;
  late TextEditingController num2EditingController;
  late String result;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();  // 클래스 - 생성자
    num1EditingController = TextEditingController();  
    num2EditingController = TextEditingController(); 
    result = ""; 
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Single Textfield'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                labelText: '글자를 입력하세요',
                border: OutlineInputBorder()
              ),
              keyboardType: TextInputType.text,
            ),
            ElevatedButton(
              onPressed: inputCheck, 
              child: Text('출력')
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: num1EditingController,
                decoration: InputDecoration(
                  labelText: '숫자를 입력하세요.',
                  border: OutlineInputBorder()
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: num2EditingController,
                decoration: InputDecoration(
                  labelText: '숫자를 입력하세요.',
                  border: OutlineInputBorder()
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            ElevatedButton(
              onPressed: addAction, 
              child: Text('덧셈 계산')
            ),
            Text(
              result,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  } // build



  void inputCheck(){
    if(textEditingController.text.trim().isEmpty){
      // errorSnackBar();
      _snackBar("글자를 입력 하세요.", Colors.red);
    }else{
      // showSnackBar();
      _snackBar("입력한 글자는 ${textEditingController.text.trim()} 입니다.", Colors.blue);
    }
  }

  void _snackBar(String message, Color color){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
        backgroundColor: color,
      )
    );
  }



  void errorSnackBar(){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("글자를 입력 하세요."),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      )
    );
  }

  void showSnackBar(){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("입력한 글자는 ${textEditingController.text.trim()} 입니다."),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.blue,
      )
    );
  }
  
  void addAction(){
    if(num1EditingController.text.trim().isNotEmpty && num2EditingController.text.trim().isNotEmpty){
      int num1 = int.parse(num1EditingController.text.trim());
      int num2 = int.parse(num2EditingController.text.trim());
      int sum = num1 + num2;

    result = "$num1 + $num2 = $sum";
    setState(() {});
    }else{
      _snackBar("숫자를 입력하세요", Colors.red);
    }
  }
} // class