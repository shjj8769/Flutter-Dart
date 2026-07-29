import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late int count;

  @override
  void initState() {
    super.initState();
    count = 0;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Count Up & Down'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                "현재 클릭 수는 $count 입니다."
                            ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  onPressed: clickCountAdd,
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  child: Icon(Icons.add),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(50)
                  ),
                             ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  onPressed: clickCountRemove,
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  child: Icon(Icons.remove),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(50)
                  ),
                ),
              ),
             ]
            ),
          ],
        ),
      ),
    );
  } // build




  void clickCountAdd(){
    count ++;
    setState(() {});
  }
  
  void clickCountRemove(){
    count --;
    setState(() {});
  }
} // class