import 'package:collection_view_image_app/view/second_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FitstPageState();
}

class _FitstPageState extends State<FirstPage> {
  // Property
  late List<String> flowerName;       // 이미지 
  late List<String> imagePath;        // 이미지 경로 이름

  @override
  void initState() {
    super.initState();
    flowerName = [
      'flower_01.png',
      'flower_02.png',
      'flower_03.png',
      'flower_04.png',
      'flower_05.png',
      'flower_06.png',
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flower Garden'),
        centerTitle: true,
      ),
      body: GridView.builder(
        itemCount: 6,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ), 
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(30)
                    ),
                    color: Colors.grey[400],
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () => Get.to(SecondPage(), arguments: flowerName[index]),
                          child: ClipRRect(
                            borderRadius: BorderRadiusGeometry.all(Radius.circular(20)),
                            child: Image.asset(
                              'images/${flowerName[index]}',
                              width: 100,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    flowerName[index],
                  ),
                ]
              ),
              Center(
                child: Transform.rotate(
                  angle: 0.8,
                  child: Text(
                    'All rights reserved',
                    style: TextStyle(
                      color: Colors.red
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}