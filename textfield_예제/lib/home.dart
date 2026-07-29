import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late TextEditingController num1EditingController;
  late TextEditingController num2EditingController;
  late TextEditingController addController;
  late TextEditingController subController;
  late TextEditingController mulController;
  late TextEditingController divController;

  @override
  void initState() {
    super.initState();
    num1EditingController = TextEditingController();
    num2EditingController = TextEditingController();
    addController = TextEditingController();
    subController = TextEditingController();
    mulController = TextEditingController();
    divController = TextEditingController();


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('간단한 계산기'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: num1EditingController,
              decoration: const InputDecoration(
                labelText: '첫번째 숫자를 입력하세요.'
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: num2EditingController,
              decoration: const InputDecoration(
                labelText: '두번째 숫자를 입력하세요.'
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: numAction,
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(5)
                      ),
                    ),
                  child: Text('계산하기'),
                  
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: deleteAction, 
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(5)
                    ),
                  ),
                  child: Text('지우기'),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: addController,
              decoration: InputDecoration(
                labelText: '덧셈 결과.',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: subController,
              decoration: InputDecoration(
                labelText: '뺄셈 결과.',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: mulController,
              decoration: InputDecoration(
                labelText: '곱셈 결과.',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: divController,
              decoration: InputDecoration(
                labelText: '나눗셈 결과.',
              ),
            ),
          ),
        ],
      ),
    );
  } // build



  void numAction(){
    if(num1EditingController.text.trim().isEmpty || num2EditingController.text.trim().isEmpty){
      _snackBar("숫자를 입력 하세요.", Colors.red);
    }else{
      int num1 = int.parse(num1EditingController.text.trim());
      int num2 = int.parse(num2EditingController.text.trim());
      double num3 = double.parse(num1EditingController.text.trim());
      double num4 = double.parse(num2EditingController.text.trim());

      int sum = num1 + num2;
      int sub = num1 - num2;
      int mul = num1 * num2;
      double div = num3 / num4;
      addController.text = '$sum';
      subController.text = '$sub';
      mulController.text = '$mul';
      divController.text = '$div';
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

  void deleteAction(){
    num1EditingController.text = "";
    num2EditingController.text = "";
    addController.text = "";
    subController.text = "";
    mulController.text = "";
    divController.text = "";
  }

  
} // class