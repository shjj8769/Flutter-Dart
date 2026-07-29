import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late Color buttonColor;
  late bool switchValue;

  @override
  void initState() {
    super.initState();
    buttonColor = Colors.blue;
    switchValue = false;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Changed Button color on Switch'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: changeSwitch,
              style: TextButton.styleFrom(
                backgroundColor: buttonColor,
                foregroundColor: Colors.white,
                
              ),
              child: Text('Flutter'),
            ),
            Switch(
              value: switchValue, 
              onChanged: (value) {
                switchValue = value;
                chandgeButtonColor();
              },
            ),
          ],
        ),
      ),
    );
  }

  void changeSwitch(){
    switchValue = switchValue ? false : true;
    chandgeButtonColor();
  }

  void chandgeButtonColor(){
    buttonColor = switchValue ? Colors.red : Colors.blue;
    setState(() {});
  }



  // void chandgeButtonColor(bool value){
  //   if(value == false){
  //     textButton = Colors.blue;
  //   }else {
  //     textButton = Colors.red;
  //   }
  //   setState(() {});
  // }
}