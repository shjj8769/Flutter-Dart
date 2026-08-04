import 'package:flutter/material.dart';
import 'package:listview_insert_app/model/animal_list.dart';
import 'package:listview_insert_app/view/first_page.dart';
import 'package:listview_insert_app/view/second_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
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

  @override
  void dispose() {
    controller.dispose();               // timer - cancle()로 종료 , dispose()로 종료
    super.dispose();
  }


  void addList(){                       // addList() 생성 후 build로 넘어감
    animalList.add(Animal(
      imagePath: 'images/bee.png', 
      animalName: '벌', 
      kind: '곤충류', 
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
      kind: '포유류', 
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView Test"),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          FirstPage(list: animalList),
          SecondPage(list: animalList)
        ]
      ),
      bottomNavigationBar: TabBar(
        controller: controller,
        tabs: [
          Tab(
            icon: Icon(
              Icons.looks_one,
              color: Colors.blue,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.looks_two,
            ),
          )
        ]
      ),
    );
  }
}