import 'package:collection_view_label_app/view/detail_hero.dart';
import 'package:collection_view_label_app/view/insert_hero.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QueryHero extends StatefulWidget {
  const QueryHero({super.key});

  @override
  State<QueryHero> createState() => _QueryHeroState();
}

class _QueryHeroState extends State<QueryHero> {
  // Property
  late List<String> heroList;

  @override
  void initState() {
    super.initState();
    heroList = [
      "유비",
      "관우",
      "장비",
      "조조",
      "여포",
      "조선",
      "손건",
      "장양",
      "손책",
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('삼국지 인물'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(InsertHero())!.then((value) => rebuildData(value.toString()));   // 널 값이 아닐 때 받아와서 실행하겠다
            }, 
            icon: Icon(Icons.add)
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(                 // 한 줄 당 정해놓은 개수대로 나누기 / builder 다음 count 개수 넣기
          itemCount: heroList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,     // <<<<< 한 줄의 개수 정해주기
            mainAxisSpacing: 10,   // <<<<< 개당 간격 (padding과 동일)
            crossAxisSpacing: 10
          ), 
          itemBuilder: (context, index) {
            return Container(               // container만 색 줄 수 있음
              color: Colors.grey,
              child: GestureDetector(       // card 눌렀을 경우에만 넘기기 (container 색 눌렀을 때 x)
                onTap: () => Get.to(DetailHero(), arguments: heroList[index]),
                child: Card(
                  color: Colors.amber[200],
                  child: Center(
                    child: Text(heroList[index]),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  } // build

  // ------------ Function -------------
  void rebuildData(String value){
    if(value != ""){
      heroList.add(value);
    }
    setState(() {});
  }
} // class