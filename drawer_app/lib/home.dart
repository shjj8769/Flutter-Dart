import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text('Mail'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => mailRoute(context, '/send'),
            icon: Icon(Icons.email),
            ),
          IconButton(
            onPressed: () => mailRoute(context, '/receive'),
            icon: Icon(Icons.email_outlined),
            ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => mailRoute(context, '/send'),
              child: Text('보낸 편지함'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => mailRoute(context, '/receive'),
              child: Text('받은 편지함'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(    // 차곡차곡 쌓을 수 있음
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/pikachu-1.jpg'),
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundImage: AssetImage('images/pikachu-2.jpg'),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('images/pikachu-3.jpg'),
                ),
              ],
              accountName: Text('Pikachu'), 
              accountEmail: Text('pikachu@naver.com'),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.email,
                color: Colors.blue,
              ),
              title: Text("보낸 편지함"),
              onTap:() => mailRoute(context, '/send'),
            ),
            ListTile(
              leading: Icon(
                Icons.email_outlined,
                color: Colors.red,
              ),
              title: Text("받은 편지함"),
              onTap: () => mailRoute(context, '/receive'),
            ),
          ],
        ),
      ),
    );
  }

    void mailRoute(BuildContext context, String route){
    Navigator.pushNamed(context, route);
  }









}