import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: Text("Buttons"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => print('============> test button'),
              onLongPress: addFunction,
              style: TextButton.styleFrom(
              foregroundColor: Colors.red
              ),  
             child: Text(
              'Text Button',
              style: TextStyle(
                fontSize: 20,
              ),
             ),
            ),
            ElevatedButton(
              onPressed: () {
                //
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
                )
              ),
              child: Text(
                'Elevated Button'
              ),
            ),
            OutlinedButton(
              onPressed: () {
                //
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.green,
                side: BorderSide(
                  color: Colors.black,
                  width: 2.0
                ),
              ),
              child: Text(
                'Outlined Button'
              ),
            ),
            TextButton.icon(
              onPressed: () {
                //
              },
              icon: Icon(
                Icons.home,
                size: 30,
                color: Colors.red,
              ),
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
              ),
              label: Text('Go to Home'),
            ),
            ElevatedButton.icon(
              onPressed: () {
                //
              },
              icon: Icon(
                Icons.home,
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                minimumSize: Size(150, 40),
              ),
              label: Text('Go to Home'),
            ),
            OutlinedButton.icon(
              onPressed: () {
                //
              },
              icon: Icon(
                Icons.home
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                minimumSize: Size(100, 35),
              ),
              label: Text('Go to Home'),
            ),
         Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  //
                },
                 style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)
                ),
                minimumSize: Size(130, 20),
              ),
                
                child: Text(
                  'Text Button'
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  //
                },
                 style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)
                ),
                minimumSize: Size(100, 30),
              ),
                
                child: Text(
                  'Elevated Button'
                ),
              )
            ],
          ),
          ],
        ),
      ),
    );
  } // build
  
  // -------- Function ---------
  // 숫자 10개과 20을 받아 덧셈하는 Function
  void addFunction(){
    int intNum1 = 10;
    int intNum2 = 20;

    print("$intNum1 + $intNum2 = ${intNum1+intNum2}");
  }

} // class