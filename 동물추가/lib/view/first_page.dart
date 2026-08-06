import 'package:flutter/material.dart';
import 'package:listview_insert0806_app/model/animal_list.dart';

class FirstPage extends StatefulWidget {
  final List<Animal> list;                          // 인스턴스 변수 (이 페이지 안에서만 사용하기 위함)
  const FirstPage({super.key, required this.list});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: ListView.builder(
        itemCount: widget.list.length,              // 개수
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => _showDialog(index),
            child: Card(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                        widget.list[index].imagePath
                      ),
                      radius: 30,
                    ),
                  ),
                  Text(
                    "     ${widget.list[index].animalName}  /  ${widget.list[index].kind}"
                  ),
                ],
              ),
            ),
          );
        },
      )
    );
  } // build



  void _showDialog(int index){
    showDialog(
      context: context, 
      builder: (context) {
        return AlertDialog(
          title: Center(
            child: Text(
              widget.list[index].animalName,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          content: Text(
            '이 동물은 ${widget.list[index].animalName} 입니다 \n'
            '${widget.list[index].flyExist ? "날 수 있습니다." : "날 수 없습니다."}' ,
            textAlign: TextAlign.center,
            ),
        );
      },
    );
  }
} // class