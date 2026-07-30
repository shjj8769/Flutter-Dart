import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late TextEditingController heightController;
  late TextEditingController weightController;
  late double bmiResult;
  late String result;
  late String bmi;
  late double bmiNumber;
  late AssetImage bmiImage;
  late List<int> bmiArrow;

  @override
  void initState() {
    super.initState();
    heightController = TextEditingController();
    weightController = TextEditingController();
    result = "";
    bmiResult = 0;
    bmi = "";
    bmiNumber = 0;
    bmiImage = AssetImage('images/bmi.jpg');
    bmiArrow = [40, 100, 176, 245, 315];
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI 계산기'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: heightController,
              decoration: const InputDecoration(
                labelText: '신장을 입력하세요 (단위 : cm)',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: weightController,
              decoration: const InputDecoration(
                labelText: '몸무게를 입력하세요 (단위 : kg)',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: inputCheck,
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              child: Text('BMI 계산'),
            ),
          ),
          Text(
            result,
            style: TextStyle(
              color: Colors.red,
              fontSize: 20,
              fontWeight: FontWeight.bold 
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB('$bmiArrow', 0, 0, 0),
            child: Row(
              children: [
                Icon(
                  Icons.arrow_downward,
                  size: 50,
                ),
              ],
            ),
          ),
          Image(image: bmiImage)
        ],
      ),
    );
  } // build

  void inputCheck(){
    if(heightController.text.trim().isNotEmpty && weightController.text.trim().isNotEmpty){
      double height = double.parse(heightController.text.trim())/100;
      double weight = double.parse(weightController.text.trim());
      double bmiResult = double.parse((weight / (height * height)).toStringAsFixed(1));
        "귀하의 BMI지수는 $bmiResult로 $result 입니다.";
    }else {
      bmi = "";
    }
    
      _bmiCheck();
  }

  



  void _bmiCheck(){
    double height = double.parse(heightController.text.trim())/100;
    double weight = double.parse(weightController.text.trim());
    double bmiResult = double.parse((weight / (height * height)).toStringAsFixed(1));
    if(bmiResult < 18.4){
      result = '귀하의 BMI지수는 $bmiResult로 저체중 입니다.';
      bmiArrow[0];
    }else if(bmiResult >= 18.5 && bmiResult <= 22.9){
      result = '귀하의 BMI지수는 $bmiResult로 정상체중 입니다.';
      bmiArrow[1];
    }else if(bmiResult >= 23 && bmiResult <= 24.9){
      result = '귀하의 BMI지수는 $bmiResult로 과체중 입니다.';
      bmiArrow[2];
    }else if(bmiResult >= 25 && bmiResult <= 29.9){
      result = '귀하의 BMI지수는 $bmiResult로 비만 입니다.';
      bmiArrow[3];
    }else if(bmiResult >= 30){
      result = '귀하의 BMI지수는 $bmiResult로 고도비만 입니다.';
      bmiArrow[4];
    }
    setState(() {});    // 내부 상태 변화 프레임워크에 알리고 화면 표시
  }
} // class