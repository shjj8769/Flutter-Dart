import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String buttonText;
  late String buttonState;
  late Color buttonColor;

  @override
  void initState() {
    super.initState();
    buttonText = "Hello";
    buttonColor = Colors.blue;
    buttonState = false;

    print("-------- iniState()를 구동했습니다.");
  }



  @override
  Widget build(BuildContext context) {
    print("------- build()를 구동했습니다.");
    return Scaffold(
      appBar: AppBar(
        title: Text('Change button color & text'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _hellobutton(), 
              child: Text('$buttonText'),
              style: TextButton.styleFrom(
                backgroundColor: buttonColor,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ----- Function ------
  void _hellobutton(){
    print("------ _hellobutton()을 구동했습니다.");
    if(buttonState == false){
      buttonText = "Hello";
      buttonColor = Colors.blue;
    }else{
      buttonText = "Flutter";
      buttonColor = Colors.amber;
    }
    setState(() {});
  }



}