import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late String title;
  late Color appBarColor;
  late String yesSir;
  late String currentSmile;
  late int clickCount;
  bool isSmileMode = true;


  @override
  void initState() {
    super.initState();
    title = 'Smile';
    appBarColor = Colors.amber;
    yesSir = 'OK';
    currentSmile = 'images/smile.png';
    clickCount = 0;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: appBarColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(currentSmile),
              radius: 50,
            ),
            ElevatedButton(
              onPressed: () {
                print(title);
                setState(() {
                  clickCount ++;
                  print("버튼 눌린 횟수 ${clickCount}");
                  if(isSmileMode){
                    if(clickCount % 5 == 0) {
                      yesSir == "네 알겠습니다.";
                      currentSmile = 'images/꼬부기.jpg';
                      appBarColor = Colors.green;
                      title = 'ggobugy';
                      yesSir = '네 알겠습니다.';
                      isSmileMode = false;
                    }
                    else {
                      currentSmile = 'images/smile.png';
                      title = "smile";
                      appBarColor = Colors.amber;
                      yesSir = "OK";
                    }
                  }
                  else{
                    currentSmile = 'images/smile.png';
                    title = "Smile";
                    appBarColor = Colors.amber;
                    yesSir = "OK";
                    isSmileMode = true;
                    clickCount = 0;
                  }
                });
              }, 
              child: Text(yesSir),
            ),
          ],
        ),
      )
    );
  }
}