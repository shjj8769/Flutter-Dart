import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late TextEditingController textEditingController;
  late List<String> fruitName;
  late String result;
  late int currentName;
  late Timer _timer;
  late String str;


@override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    str = "";
    fruitName = str.split("");
    currentName = 0;
    result = "";
    

  }


  void _currentName(){
    str = textEditingController.text;
    fruitName = str.split("");

    if(currentName >= fruitName.length){
      currentName = 0;
      result = fruitName[currentName];
    }else {
      result += fruitName[currentName];
    }
      currentName ++;
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LED 광고'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('광고 문구를 입력하세요.'), 
              accountEmail: Text(""),
              decoration: BoxDecoration(
                color: Colors. red,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                textAlign: TextAlign.start,
                controller: textEditingController,
                decoration: const InputDecoration(
                  labelText: "글자를 입력하세요."
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
              child: SizedBox(
                width: 20,
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: _textButton, 
                      child: const Text('광고문구 생성'),
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(
                          color: Colors.amber,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)
                        )
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              result,
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _textButton(){

    _timer = Timer.periodic(Duration(seconds: 2), (timer) => _currentName(),);
    if(textEditingController.text.trim().isNotEmpty){
      _currentName();
    }else{
      result = "";
    }
    setState(() {});
  }
  
}