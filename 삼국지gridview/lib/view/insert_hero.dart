import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InsertHero extends StatefulWidget {
  const InsertHero({super.key});

  @override
  State<InsertHero> createState() => _InsertHeroState();
}

class _InsertHeroState extends State<InsertHero> {
  // Property
  late TextEditingController heroController;

  @override
  void initState() {
    super.initState();
    heroController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('인물 추가'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: heroController,
                decoration: InputDecoration(
                  labelText: '인물을 추가 하세요',
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: () {
                  String resultMessage = "";
                  if(heroController.text.trim().isNotEmpty){
                    resultMessage = heroController.text.trim();
                  
                    Get.back(result: resultMessage);        // 값을 가지고 back하겠다.
                  }
                  
                    setState(() {});
                }, 
                child: Text('추가')
              ),
            ),
          ],
        ),
      ),
    );
  }
}