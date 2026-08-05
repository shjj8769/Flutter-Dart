import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_intro_app/third_page.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(    // <<<<<<<<<<<<<<<<<< Get 패키지 사용 (context 사용관리 안해도 됨)
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const Home(),
      getPages: [             // getPages(리스트 형식) 안에 GetPage는 단수형
        GetPage(
          name: '/third',     // third 정보  (ex : name : '/customer/insert' - 고객정보 입력)
          page: () => ThirdPage(),
        ),
        GetPage(
          name: '/third2', 
          page: () => ThirdPage(),
          transition: Transition.cupertino,
          transitionDuration: Duration(seconds: 2)        // 생성할 때 만들어줘야 효과 나타남
        ),
      ],
    );
  }
}
