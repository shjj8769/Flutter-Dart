import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quiz_17_get_app/view/detail_list.dart';
import 'package:quiz_17_get_app/view/insert_list.dart';

class TableList extends StatefulWidget {
  const TableList({super.key});

  @override
  State<TableList> createState() => _TableListState();
}

class _TableListState extends State<TableList> {
  // Property
  late List<String> imagePath;
  late List<String> workList;
  late String imageName;
  late String workName;
  late int images;
  final box = GetStorage();

  @override
  void initState() {
    super.initState();
    imagePath = ['images/cart.png', 'images/clock.png', 'images/pencil.png'];
    workList = ['책 구매', '철수와 약속', '스터디 준비하기'];
    imageName = "";
    workName = "";
    images = 0;
  }








  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main View'),
        centerTitle: true,      // 가운데 정렬
        actions: [              // 아이콘 추가
          IconButton(
            onPressed: () {
              Get.to(() => InsertList(list: imageName))!.then((value) => rebuildborder());
            },  
            icon: Icon(Icons.add)
          ),
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: imagePath.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                imageName = imagePath[index];   
                workName = workList[index];
                box.write('imagePath', imageName);
                box.write('workList', workName);
                Get.to(
                  DetailList(),
                );
              },
              child: SizedBox(
                height: 100,
                  child: Card(
                    color: index % 2 == 0
                    ? Colors.deepPurple 
                    : Colors.purple,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            imagePath[index],
                          ),
                        ),
                        Text(
                          "       ${workList[index]}"
                        ),
                      ],
                    ),
                  ),
              ),
            );
          },
        ),
      ),
    );
  } // build


  //========= Function ============
  void rebuildborder(){
    if (box.read('imagePath') == null || box.read('workList') == null) {
      return;
    }
    imageName = box.read('imagePath');
    workName = box.read('workList');
    if(imageName.isNotEmpty && workName.isNotEmpty){
    imagePath.add(imageName);
    workList.add(workName);

    box.write('imagePath', imageName);  
    box.write('workList', workName);  
    setState(() {});
    }
    
  }

} // class