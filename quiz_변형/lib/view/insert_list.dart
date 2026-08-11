import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';



class InsertList extends StatefulWidget {
  final String list;
  const InsertList({super.key, required this.list});

  @override
  State<InsertList> createState() => _InsertListState();
}

class _InsertListState extends State<InsertList> {
  // Property
  late TextEditingController textEditingController;       // 추가 목록 문자 사용
  late List<String> imagePath;
  late String imageList;
  late String workList;
  late int images;
  final box = GetStorage();

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    imagePath = ['images/cart.png', 'images/clock.png','images/pencil.png'];
    imageList = "";
    workList = "";
    images = 0;
    initStorage();    

  }

  void initStorage(){
    box.write('imagePath', imagePath); 
    box.write('workList', workList); 
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add View'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(imagePath[images]),
              SizedBox(
                width: 200,
                height: 150,
                child: CupertinoPicker.builder(
                  childCount: imagePath.length,
                  itemExtent: 40,         // picker 크기 
                  backgroundColor: Colors.purple[100],
                  onSelectedItemChanged: (value) {
                    rebuildborder(value);
                    setState(() {});
                  }, 
                  itemBuilder: (context, index) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Image.asset(
                          imagePath[index],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            width: 350,
            height: 100,
            child: TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                labelText: '목록을 입력하세요'
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if(textEditingController.text.trim().isNotEmpty){
                addList();            // tabel_list에 추가될 내용
                saveStorage();
              }
              Get.back();   
              setState(() {});          // 뒤로 돌아가기
            }, 
            child: Text("OK")
          ),
        ],
      ),
    );
  } // build
  // ========= Function ==============
  void rebuildborder(int value){
    images = value;
    imageList = imagePath[images];
    }


  void addList(){
    imageList = imagePath[images]; 
    workList = textEditingController.text.trim();
  }

  void saveStorage(){
    box.write('imagePath', imageList);
    box.write('workList', workList);
  }

} // class