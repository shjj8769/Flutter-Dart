import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {            // stateful로 변경 되었기에 기능 구현 가능
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void _changeThemeMode(ThemeMode themeMode){
    _themeMode = themeMode;
    setState(() {});
  }

  static const seedColor = Colors.red;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: _themeMode,
      theme: ThemeData(
        brightness: Brightness.light,           // light 모드일 경우
        colorSchemeSeed: seedColor
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,            // dark 모드일 경우
        colorSchemeSeed: seedColor
      ),
      home: Home(onChangeTheme: _changeThemeMode),
    );
  }
}
