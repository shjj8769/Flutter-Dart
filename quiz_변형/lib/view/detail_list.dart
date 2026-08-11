import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class DetailList extends StatefulWidget {
  const DetailList({super.key});

  @override
  State<DetailList> createState() => _DetailListState();
}

class _DetailListState extends State<DetailList> {
  // Property
  late String workList;
  late String imagePath;
  final box = GetStorage();

  @override
  void initState() {
    super.initState();
    imagePath = "";
    workList = "";
    loadStorage();
  }

  void loadStorage(){       // 데이터 읽어오기
    box.read('imagePath');
    box.read('workList');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail View'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              box.read('imagePath'),
              width: 100,
            ),
            Text(
              box.read('workList'),
            ),
          ],
        ),
      ),
    );
  }
}