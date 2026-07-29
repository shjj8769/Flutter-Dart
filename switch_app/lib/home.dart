import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late bool switchValue;  // Switch의 상태
  late String switchText;
  late String switchImage;

  @override
  void initState() {
    super.initState();
    switchValue = true;
    switchText = "Pikachu";
    switchImage = 'images/pikachu-1.jpg';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(switchText),
        
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(switchImage),
              radius: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(switchText),
                Switch(
                  value: switchValue, 
                  onChanged: (value) {
                   switchValue = value;
                   _switchAction(value);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  } // build


  // ------- Function --------
  // Switch의 변경에 따른 화면 구성 변경
  void _switchAction(bool value){
    if(value == true){
     switchText = "Pikachu";
     switchImage = 'images/pikachu-1.jpg';
    }else{
       switchText = "Smile";
       switchImage = 'images/smile.png';
     }
    setState(() {});

  }




} // class