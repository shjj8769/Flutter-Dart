import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listview_insert0806_app/model/animal_list.dart';

class SecondPage extends StatefulWidget {
  final List<Animal> list;
  final State homeState;
  const SecondPage({super.key, required this.list, required this.homeState});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {    // 전역변수라 ()없이 사용가능
  // Property
  late TextEditingController nameController;
  late int _radioValue;
  late bool flyExist;
  late String imagePath;
  late List<Color> animalColor;                       // 각 동물에 리스트 형태로 컬러 적용
  late int initiLength;                               // 동물 초기 개수
  

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    _radioValue = 0;
    flyExist = true;
    imagePath = "";
    animalColor = [];
    initiLength = widget.list.length;


    for(int i = 0; i < widget.list.length; i++){      // <<<<<<<<<< 초기 리스트 개수만큼 컬러 적용 (for문 사용)
      animalColor.add(Colors.amber);
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: '등록할 동물 이름을 입력하세요'  // 타이핑 하는 순간 사라짐
                ),
                keyboardType: TextInputType.text,
                maxLength: 20,    // 전체 길이 20
                maxLines: 1,      // 한 줄로 구성
              ),
              RadioGroup(
                groupValue: _radioValue,
                onChanged: (value) {
                  _radioValue = value!;
                  setState(() {});
                }, 
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(value: 0),
                    Text('양서류'),
                    Radio(value: 1),
                    Text('파충류'),
                    Radio(value: 2),
                    Text('포유류'),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('날 수 있나요?'),
                  Checkbox(
                    value: flyExist, 
                    onChanged: (value) {
                      flyExist = value!;
                      setState(() {});                  // 박스 표시 현황
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: initiLength,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => rebuildBorder(index),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: animalColor[index],
                            width: 2,
                          ),
                        ),
                        child: Image.asset(
                          widget.list[index].imagePath,
                        ),
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () => _showDialog(),
                child: Text('동물 추가하기')
              ),
            ],
          ),
        ),
      ),
    );
  } // build


  // ------------ Function ---------------
  void rebuildBorder(int index){
    for(int i = 0; i < widget.list.length; i++){
      animalColor[i] = Colors.amber;
    }
    animalColor[index] = Colors.red;
    imagePath = widget.list[index].imagePath;

    setState(() {});
  }

  void _showDialog(){
    Animal animal = Animal(
      imagePath: imagePath, 
      animalName: nameController.text.trim(), 
      kind: getKind(_radioValue), 
      flyExist: flyExist
    );

    Get.defaultDialog(
      title: "동물 추가하기",
      middleText: '이 동물은 ${animal.animalName} 입니다 \n'
      '또 동물의 종류는 ${animal.kind} 입니다 \n'
      '이 동물은 ${animal.flyExist ? "날 수 있습니다." : "날 수 없습니다."}\n\n'
      '이 동물을 추가 하시겠습니까?',
      barrierDismissible: false,
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                widget.list.add(animal);
                animalColor.add(Colors.amber);
                widget.homeState.setState(() {});     // 버튼을 눌렀을 때 

                // 초기화
                nameController.text = "";
                _radioValue = 0;
                flyExist = false;
                imagePath = "";

                Get.back();
                setState(() {});
              }, 
              child: Text('예'),
            ),
            TextButton(
              onPressed: () => Get.back(), 
              child: Text('아니오'),
            ),
          ],  // children
        )
      ]  // action
    );
  }

  String getKind(int radioValue){
    String kind = "";
    switch(radioValue){
      case 1:
      kind = '파충류';
      case 2:
      kind = '포유류';
      default:
      kind = '양서류';
    }

    return kind;
  }
} // class