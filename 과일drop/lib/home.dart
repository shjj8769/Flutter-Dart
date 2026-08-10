import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late List<String> items;              // 이미지 리스트형식으로
  late String dropdownValue;           // 과일 종류 dropdownbutton
  late String imageName;                // 이미지 경로


  @override
  void initState() {                    // 첫 화면 구성
    super.initState();
    items = [                           // 글자만
      'Apple',
      'Banana',
      'Grape',
      'Orange',
      'Pineapple',
      'Watermelon'
    ];
      dropdownValue = 'Apple';          // dropdownbutton 첫 표시에 나오는 문자
      imageName = 'Apple'; 
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drop Down Button'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton(
              value: dropdownValue,                    // 화면에 보이는 글자
              icon: Icon(Icons.keyboard_arrow_down),
              items: items.map((String item) {        // build 안하고 map통해 사용
                return DropdownMenuItem(
                  value: item,
                  child: Text(
                    item
                  ),
                );
              },).toList(), 
              onChanged: (value) {
                dropdownValue = value.toString();
                imageName = value.toString();
                setState(() {});
              },
            ),
            Image.asset(
              'images/$imageName.png',
              width: 200,
            ),
          ],
        ),
      ),
    );
  }
}