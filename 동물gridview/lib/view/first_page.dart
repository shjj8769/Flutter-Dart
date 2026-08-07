import 'package:flutter/material.dart';
import 'package:gridview_insert_app/model/animal_list.dart';

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
      body: GridView.builder(
        itemCount: widget.list.length,              // 개수
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => _showDialog(index),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                            widget.list[index].imagePath
                          ),
                          radius: 50,
                        ),
                      ),
                      Text(
                        "     ${widget.list[index].animalName}  \n"
                        "     ${widget.list[index].kind}   "
                      ),
                    ],
                  ),
                ),
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