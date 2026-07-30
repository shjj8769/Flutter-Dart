import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late TextEditingController num1EditingController;    // 첫번째 숫자 입력
  late TextEditingController num2EditingController;    // 두번째 숫자 입력
  late TextEditingController addController;            // 덧셈 결과
  late TextEditingController subController;            // 뺄셈 결과
  late TextEditingController mulController;            // 곱셈 결과
  late TextEditingController divController;            // 나눗셈 결과
  late bool sumSwitchValue;                            // 덧셈 스위치
  late bool subSwitchValue;                            // 뺄셈 스위치
  late bool mulSwitchValue;                            // 곱셈 스위치
  late bool divSwitchValue;                            // 나눗셈 스위치
  late String sumReserve;                                     // 덧셈 결과 보관
  late String subReserve;                                     // 뺄셈 결과 보관
  late String mulReserve;                                     // 곱셈 결과 보관
  late String divReserve;                                     // 나눗셈 결과 보관

  @override
  void initState() {
    super.initState();
    num1EditingController = TextEditingController();  
    num2EditingController = TextEditingController();  
    addController = TextEditingController();          
    subController = TextEditingController();          
    mulController = TextEditingController();          
    divController = TextEditingController();  
    sumSwitchValue = true;        
    subSwitchValue = true;        
    mulSwitchValue = true;        
    divSwitchValue = true;  
    sumReserve = "";  
    subReserve = "";  
    mulReserve = "";  
    divReserve = "";  
        
    


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
              textAlign: TextAlign.end,
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
              textAlign: TextAlign.end,   // 숫자는 우측 , 문자는 좌측
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('덧셈'),
              Switch(
                value: sumSwitchValue, 
                onChanged: (value) {
                  sumSwitchValue = value;
                  _switchAction();
                },
              ),
              Text('뺄셈'),
              Switch(
                value: subSwitchValue, 
                onChanged: (value) {
                  subSwitchValue = value;
                  _switchAction();
                },
              ),
              Text('곱셈'),
              Switch(
                value: mulSwitchValue, 
                onChanged: (value) {
                  mulSwitchValue = value;
                  _switchAction();
                },
              ),
              Text('나눗셈'),
              Switch(
                value: divSwitchValue, 
                onChanged: (value) {
                  divSwitchValue = value;
                  _switchAction();
                },
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

      sumReserve = sum.toString();  // toString() - 변수가 단독으로 쓰일 때 사용(오버헤드 줄일 수 있음)
      subReserve = sub.toString();
      mulReserve = mul.toString();
      divReserve = div.toString();

    

      

      // 나눗셈의 결과는 실수, 분모가 0인경우에 계산할 수 없음
      // if(num2 == 0){
      //   divController.text = "Impossible";
      // }else{
      //   double div = num1 / num2;
      //   divController.text = div.toString();
      // }
      // addController.text = "$sum";      // "$" - 뒤에 단위나 다른 글자를 붙여야 할 때 편리함 (문자열 보간법)
      // subController.text = "$sub";
      // mulController.text = "$mul";
      // divController.text = "$div";

    }
    _switchAction();
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

  // void sumSwitchAction(bool value){
  //   if(value == true){
  //     int num1 = int.parse(num1EditingController.text.trim());
  //     int num2 = int.parse(num2EditingController.text.trim());
  //     int sum = num1 + num2;
  //     addController.text = sum.toString();
  //   }else{
  //     addController.text = "";
  //   }
  //   setState(() {});
  // }
  // void subSwitchAction(bool value){
  //   if(value == true){
  //     int num1 = int.parse(num1EditingController.text.trim());
  //     int num2 = int.parse(num2EditingController.text.trim());
  //     int sub = num1 - num2;
  //     subController.text = sub.toString();
  //   }else{
  //     subController.text = ""; 
  //   }
  //   setState(() {});
  // }

  // void mulSwitchAction(bool value){
  //   if(value == true){
  //     int num1 = int.parse(num1EditingController.text.trim());
  //     int num2 = int.parse(num2EditingController.text.trim());
  //     int mul = num1 * num2;
  //     mulController.text = mul.toString();
  //   }else{
  //     mulController.text = "";
  //   }
  //     setState(() {});
  // }
  // void divSwitchAction(bool value){
  //   if(value == true){
  //     double num3 = double.parse(num1EditingController.text.trim());
  //     double num4 = double.parse(num2EditingController.text.trim());
  //     double div = num3 / num4;
  //     divController.text = div.toString();
  //   }else{
  //     divController.text = "";
  //   }
  //   setState(() {});
  // }
  
  void _switchAction(){
    addController.text = sumSwitchValue ? sumReserve : "";
    subController.text = subSwitchValue ? subReserve : "";
    mulController.text = mulSwitchValue ? mulReserve : "";
    divController.text = divSwitchValue ? divReserve : "";
    
    setState(() {});
  }

  void removeAction(){
    num1EditingController.text = "";
    num2EditingController.text = "";
    addController.text = "";
    subController.text = "";
    mulController.text = "";
    divController.text = "";
  }
  
} // class