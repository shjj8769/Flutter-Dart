import 'package:charts_barchart_app/model/developer_data.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //  Property
  late List<DeveloperData> data;
  late TooltipBehavior tooltipBehavior;             // 차트 정하기

  @override
  void initState() {
    super.initState();
    data = [];
    tooltipBehavior = TooltipBehavior(enable: true);
    addData();
  }

  void addData(){
    data.add(DeveloperData(
      year: 2017, 
      developers: 19000)
    );
    data.add(DeveloperData(
      year: 2018, 
      developers: 40000)
    );
    data.add(DeveloperData(
      year: 2019, 
      developers: 35000)
    );
    data.add(DeveloperData(
      year: 2020, 
      developers: 37000)
    );
    data.add(DeveloperData(
      year: 2021, 
      developers: 45000)
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bar Chart'),
      ),
      body: Center(
        child: SizedBox(
          width: 380,
          height: 600,
          child: SfCartesianChart(            // 막대그래프 차트 (Cartesian)
            title: ChartTitle(
              text: 'Yearly Growth in th Flutter Community'
            ),
            legend: Legend(isVisible: true),    // 분포 표기
            tooltipBehavior: tooltipBehavior,   // 데이터 터치하면 정보 띄워줌
            series: [
              // BarSeries : 가로축 막대 그래프
              // ColumnSeries : 세로축 막대 그래프
              // LineSeries : 선 그래프
              // ScatterSeries : 산점도
              ColumnSeries<DeveloperData, int>( //  생성자 형식으로 전환 <> 
                color: Theme.of(context).colorScheme.primaryContainer,
                name: 'Developer Community',
                dataSource: data,   // 리스트 형식이지만 만들어놨기에 변수만
                xValueMapper: (DeveloperData developers, _) => developers.year, // x축 
                yValueMapper: (DeveloperData developers, _) => developers.developers,  // y축
                dataLabelSettings: DataLabelSettings(isVisible: true),    // 각 데이터 
                enableTooltip: true,
              ),
            ],
            // x축을 Category로 표현
            primaryXAxis: CategoryAxis(       // Category는 글자 표현
              title: AxisTitle(text: '년도'),
            ),
            // y축을 숫자로 표현
            primaryYAxis: NumericAxis(        // NumericAxis는 숫자 표현
              title: AxisTitle(text: '인원 수'),
            ),
          ),
        ),
      ),
    );
  }
}