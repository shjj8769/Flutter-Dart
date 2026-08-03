import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String imageName;
  late bool buttonColor;

  @override
  void initState() {
    super.initState();
    imageName = 'images/lamp_on.png';
    buttonColor = true;
    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert를 이용한 메세지 출력'),
        centerTitle: true,
        backgroundColor: Colors.red[600],
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imageName,
              height: 400,
            ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () => buttonOn(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                      ),
                      
                      child: Text('켜기'),
                      
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () => buttonOff(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                      ),
                      child: Text('끄기'),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  } // build

  void onLamp(BuildContext context){
    if(buttonColor == true){

    }else{

    }
    setState(() {});
  }

  void turnLamp(){                // 전구 끌 때
  }
  
  

  


  void buttonOn(){
    if(buttonColor == true){
      showDialog(
        context: context, 
        builder: (context) {
            return AlertDialog(
              title: Text('경고'),
              content: Text("현재 램프가 켜진 상태 입니다"),
              actions: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                        Navigator.pop(context);
                        }, 
                        style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.red,
                        ),
                        child: Text('네 알겠습니다.'),
                      ),
                    ],
                  ),
                ),
              ],
            );
        },
      );

    }else{
      showDialog(
        context: context, 
        builder: (context) {
         return AlertDialog(
            title: Text('램프 켜기'),
           content: Text("램프를 켜시겠습니까?"),
           actions: [
             Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          imageName = 'images/lamp_on.png';
                          buttonColor = true;
                          Navigator.pop(context);
                          setState(() {});
                        }, 
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                        ),
                        child: Text('네'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          imageName = 'images/lamp_off.png';
                          Navigator.pop(context);
                          setState(() {});
                        }, 
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                        ),
                        child: Text('아니요'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      );
    }
    setState(() {});
  }

  void buttonOff(){
    if(buttonColor == true){
      showDialog(
        context: context, 
        builder: (context) {
          return AlertDialog(
            title: Text('램프 끄기'),
            content: Text("램프를 끄시겠습니까?"),
            actions: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          imageName = 'images/lamp_off.png';
                          buttonColor = false;
                          Navigator.pop(context);
                          setState(() {});
                        }, 
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                        ),
                        child: Text('네'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          imageName = 'images/lamp_on.png';
                          Navigator.pop(context);
                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                        ),
                        child: Text('아니요'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      );
      setState(() {});
    }else{
      showDialog(
        context: context, 
        builder: (context) {
            return AlertDialog(
              title: Text('경고'),
              content: Text("현재 램프가 꺼진 상태 입니다"),
              actions: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                        Navigator.pop(context);
                        }, 
                        style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.red,
                        ),
                        child: Text('네 알겠습니다.'),
                      ),
                    ],
                  ),
                ),
              ],
            );
        },
      );
      setState(() {});
    }
  }   // buttonoff 

} // class