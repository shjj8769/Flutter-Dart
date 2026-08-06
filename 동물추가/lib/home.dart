import 'package:flutter/material.dart';
import 'package:listview_insert0806_app/model/animal_list.dart';
import 'package:listview_insert0806_app/view/first_page.dart';
import 'package:listview_insert0806_app/view/second_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{   // <<<<<<<<< 상태 섞어 사용이 가능케 하는 함수
  // Property
  late TabController controller;
  late List<Animal> animalList;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    animalList = [];
    addList();
  }

  void addList(){
    animalList.add(Animal(
      imagePath: 'images/bee.png', 
      animalName: '벌', 
      kind: '곤충', 
      flyExist: true));

    animalList.add(Animal(
      imagePath: 'images/cat.png', 
      animalName: '고양이', 
      kind: '포유류', 
      flyExist: false));

    animalList.add(Animal(
      imagePath: 'images/cow.png', 
      animalName: '소', 
      kind: '포유류', 
      flyExist: false));
      
    animalList.add(Animal(
      imagePath: 'images/dog.png', 
      animalName: '강아지', 
      kind: '포유류', 
      flyExist: false));

    animalList.add(Animal(
      imagePath: 'images/fox.png', 
      animalName: '여우', 
      kind: '포유류', 
      flyExist: false));

    animalList.add(Animal(
      imagePath: 'images/monkey.png', 
      animalName: '원숭이', 
      kind: '영장류', 
      flyExist: false));

    animalList.add(Animal(
      imagePath: 'images/pig.png', 
      animalName: '돼지', 
      kind: '포유류', 
      flyExist: false));

    animalList.add(Animal(
      imagePath: 'images/wolf.png', 
      animalName: '늑대', 
      kind: '포유류', 
      flyExist: false));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(                                    // title에 묶어서 
          children: [
            Text('ListView Test'),
            Text(
              '전체 개수 :  ${animalList.length}',
              style: TextStyle(
                fontSize: 14
              ),
            ),
          ],
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: controller,
          indicatorColor: Colors.red,
          tabs: [
            Tab(
              text: 'Table',
              icon: Icon(
                Icons.reorder,
                color: Colors.amber,
              ),
            ),
            Tab(
              text: 'Insert',
              icon: Icon(
                Icons.extension,
                color: Colors.green,
              ),
            ),
          ]
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          FirstPage(list: animalList),          // 다시 생성
          SecondPage(
            list: animalList,                   // 매개 변수
            homeState: this,                    // 매개 변수
          ),          //
        ]
      ),
    );
  } // build

} // class