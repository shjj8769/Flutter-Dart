import 'package:flutter/material.dart';
import 'package:rotation_screen_app/view/landscape_mode.dart';
import 'package:rotation_screen_app/view/portrate_mode.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rotation Screen'),
        centerTitle: true,
      ),
      body: OrientationBuilder(                       // 화면 움직임에 따라 조절 / 서 있는지 누워있는지
        builder: (context, orientation) {
          if(orientation == Orientation.portrait){    // 서 있다면
            return PortrateMode();                    // 생성자 실행
          }else{
            return LandscapeMode();                   // 생성자 실행
          }
        }, 
        ),
    );
  }
}