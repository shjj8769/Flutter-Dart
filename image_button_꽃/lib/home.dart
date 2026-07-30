import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<String> imageName;
  late int currentImage;

  @override
  void initState() {
    super.initState();
    imageName = [
      'flower_01.png',
      'flower_02.png',
      'flower_03.png',
      'flower_04.png',
      'flower_05.png',
      'flower_06.png',
    ];
    currentImage = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('무한 이미지 반복'),
        centerTitle: true,
        backgroundColor: Colors.red[400],
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              imageName[currentImage],
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.asset(
              'images/${imageName[currentImage]}',
              width: 350,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: backButton,
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.red[400],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(5)
                      )
                    ), 
                    child: Text('이전 화면'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: nextButton,
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.red[400],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(5)
                      )
                    ), 
                    child: Text('다음 화면'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  } // Build





  void backButton(){
    currentImage --;
    if(currentImage < 0){
        currentImage = imageName.length -1;
    }
    setState(() {});
  }

  void nextButton(){
    currentImage ++;
    if(currentImage >= imageName.length){
        currentImage = 0;
    }
    setState(() {});
  }
} //  class