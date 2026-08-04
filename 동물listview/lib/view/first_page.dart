import 'package:flutter/material.dart';
import 'package:listview_insert_app/model/animal_list.dart';

class FirstPage extends StatefulWidget {
  final List<Animal> list;                          // 바꿀 수 없음. 
  const FirstPage({super.key, required this.list});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {      // build 부분은 가변적으로 지정한 값이 set state로 인해 변할 수 있음
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: widget.list.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => _showDialog(index),
              child: Card(
                child: Row(
                  children: [
                    Image.asset(
                      widget.list[index].imagePath,
                      width: 100,
                    ),
                    Text("     ${widget.list[index].animalName}")
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  } // build


  // ------- Function --------
  void _showDialog(int index){
    showDialog(
      context: context, 
      builder: (context) {
        return AlertDialog(
          title: Text(
            widget.list[index].animalName,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
          content: Row(
            children: [
              Image.asset(
                widget.list[index].imagePath,
                width: 50,
              ),
              Text(
                '이 동물은 ${widget.list[index].kind} 입니다 \n'        // 줄 바꿈 \n
                '${widget.list[index].flyExist ? "날 수 있습니다." : "날 수 없습니다"}'
              )
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(), 
              child: Text('종료')
            ),
          ],
        );
      },
    );
  }


} // class