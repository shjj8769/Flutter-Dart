import 'package:flutter/material.dart';

class PortrateMode extends StatefulWidget {
  const PortrateMode({super.key});

  @override
  State<PortrateMode> createState() => _PortrateModeState();
}

class _PortrateModeState extends State<PortrateMode> {
  @override
  Widget build(BuildContext context) {
    return Center(                          // 화면 이동 후 return 받은 후 시작
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Portrate Mode'),
        ],
      ),
    );
  }
}