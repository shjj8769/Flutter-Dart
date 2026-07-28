import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onDoubleTap: () {
                print('Title double tap');
              },
              child: Text('App Bar Icon'),
            ),
            IconButton(
              onPressed: () {
                //
              }, 
              icon: Icon(Icons.access_alarm),
            ),
          ],
        ),
        centerTitle: true,
        toolbarHeight: 100, // AppBar의 높이 조절
        leading: IconButton(  // 앱 앞에 사용하는 위젯 leading
          onPressed: () {
            //
          }, 
          icon: Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {
              //
            }, 
            icon: Icon(Icons.email),
          ),
          IconButton(
            onPressed: () {
              
            }, 
            icon: Icon(Icons.add_alarm),
          ),
          IconButton(
            onPressed: () {
              //
            }, 
            icon: Icon(Icons.add_outlined),
          ),
          GestureDetector(
            onTap: () {
              print("============== >>>>> Smile image is tapped");
            },
            child: Image.asset(
              'images/smile.png',
              width: 30,
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}