import 'package:flutter/material.dart';
import 'package:rotation_different_screen_app/view/landscape_mode.dart';
import 'package:rotation_different_screen_app/view/portrate_mode.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  bool isSwitched = false;

  void updateSwitch(bool value) {
  setState(() {
    isSwitched = value;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rotation Screen'),
        centerTitle: true,
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if(orientation == Orientation.portrait){
            return PortrateMode(switchButton: isSwitched);
          }else{
            return LandscapeMode(onSwitched: updateSwitch);
          }
        },
      ),
    );
  }
}