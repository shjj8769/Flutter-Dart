import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late List<String> listName;
  late int selectedNum;             // 몇 단 선택했는지
  late TextEditingController controller;    // 단 결과값 생성

  @override
  void initState() {
    super.initState();
    listName = [
      "2단",
      "3단",
      "4단",
      "5단",
      "6단",
      "7단",
      "8단",
      "9단",
    ];
    selectedNum = 0;
    controller = TextEditingController();
    numGugudan(selectedNum);
    setState(() {});

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            listName[selectedNum],
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(80.0),
              child: SizedBox(
                width: 100,
                height: 250,
                child: CupertinoPicker(
                  itemExtent: 50,          // 리스트 크기
                  onSelectedItemChanged: (value) {
                    selectedNum = value;
                    numGugudan(value);
                    setState(() {});
                  }, 
                  children: List.generate(            // 리스트 생성
                    listName.length, 
                    (index) => Center(
                      child: Text(
                        listName[index],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: 150,
                height: 400,
                child: TextField(
                  maxLines: 9,
                  readOnly: true,
                  controller: controller,
                  maxLength: null,
                  decoration: InputDecoration(
                    filled: true,           // decoration안에 color 채우기 - fill
                    fillColor: Colors.purple[100]
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  } // build



  // --- ------ Function -----------
  void numGugudan(int index){             // 출력창에 나와야 할 내용 담은 함수 
    int dan = index + 2;    // [2,3,4,5,6,7,8,9]
    controller.text = "";
    for(int i = 1; i <= 9; i++){
      controller.text += "$dan X $i = ${dan*i} \n";
    }
    setState(() {});
  }
} // class