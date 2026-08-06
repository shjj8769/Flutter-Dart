import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late DateTime date;                   // 날짜 데이터
  late String selectDateText;           // 화면에 보여지는 부분


  @override
  void initState() {
    super.initState();
    date = DateTime.now();              // 현재 데이터
    // print(date);
    selectDateText = "";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date Picker Example'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 한 자릿수일 때 문자열로 변환 후 ped(패딩과 동일)왼쪽 오른쪽 정한 후 몇 자리인지, 없으면 '0' 작성
            Text('현재 일자는 : ${date.year} - ${date.month.toString().padLeft(2, '0')} - ${date.day.toString().padLeft(2, '0')} 입니다'),
            ElevatedButton(
              onPressed: () => disDatePicker(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[300]
              ),
              child: Text('Date Picker')
            ),
            Text(selectDateText)
          ],
        ),
      ),
    );
  } // build


  // ----------- Function ----------------
  void disDatePicker()async{        // async 있을 때 await 필수 없으면 오류!
    int firstYear = date.year - 1;  // 첫 해를 1년 전부터 지정
    int lastYear = firstYear + 5;
    final selecedDate = await showDatePicker(
      context: context, 
      initialDate: date,    // 초기 설정해둔 값으로 버튼 열면 날짜 잡힘
      firstDate: DateTime(firstYear), 
      lastDate: DateTime(lastYear),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      locale: Locale('ko', 'KR')      // 한글로 표기 변경(이는 pubspec설정 및 main 설정)
    );
    if(selecedDate != null){              // 문자열에서 substring - 부분 문자열 출력으로 생성
      selectDateText = "선택하신 일자는 : ${selecedDate.toString().substring(0, 10)} 입니다.";
      setState(() {});
    }
  }
} // class