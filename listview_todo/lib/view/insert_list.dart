import 'package:flutter/material.dart';
import 'package:listview_todo_app/util/message.dart';

class InsertList extends StatefulWidget {
  const InsertList({super.key});

  @override
  State<InsertList> createState() => _InsertListState();
}

class _InsertListState extends State<InsertList> {
  // Property
  late TextEditingController textEditingController;
  
  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController(); 
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add View'),
      ),
      body: Column(
        children: [
          TextField(
            controller: textEditingController,
            decoration: InputDecoration(
              labelText: '목록을 입력 하세요.'
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if(textEditingController.text.trim().isNotEmpty){
                addList();
              }
              Navigator.pop(context);
            }, 
            child: Text('OK')
          ),
        ],
      ),
    );
  } // build


  void addList(){
    Message.images = "images/pencil.png";
    Message.workList = textEditingController.text.trim();
    Message.action = true;
  }
} // class