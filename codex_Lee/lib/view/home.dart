import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const _battles = [
    '옥포해전',
    '사천포해전',
    '당포해전',
    '한산도대첩',
    '부산포해전',
    '명량해전',
    '노량해전',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        backgroundColor: Colors.amber[400],
        title: const Text('영웅 Card', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('images/Lee.jpg'),
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(color: Colors.black, thickness: 1),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '성웅',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
                const Text(
                  '이순신 장군',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                const SizedBox(height: 8),
                const Text(
                  '전적',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
                const Text(
                  '62전 62승',
                  style: TextStyle(fontSize: 20, color: Colors.red),
                ),
                const SizedBox(height: 16),
                ..._battles.map(
                  (battle) => Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.check_circle_outline,
                        color: Colors.black,
                      ),
                      const SizedBox(width: 6),
                      Text(battle, style: const TextStyle(color: Colors.black)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Center(
            child: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('images/turtle.gif'),
            ),
          ),
        ],
      ),
    );
  }
}
