import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart' as latlng;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late MapController mapController;
  late Position currentPosition; // GPS 정보
  late double latData;    // 위도 정보
  late double longData;   // 경도 정보
  late bool canRun;         // GPS 신호 받았는지 여부
  late List location;       // 위치 정보 글씨

  List<List<dynamic>> castle = [
      ['혜화문', 37.5878892, 127.0037098],
      ['흥인지문', 37.5711907, 127.009506],
      ['창의문', 37.5926027, 126.9664771],
      ['숙정문', 37.5956584, 126.9810576],
    ];


  @override
  void initState() {
    super.initState();
    mapController = MapController();
    canRun = false;
    location = ['혜화문', '흥인지문', '창의문', '숙정문'];
    checkLocationPermission();
  }

  void checkLocationPermission()async{
    LocationPermission permission = await Geolocator.checkPermission();   // 앱 사용하는 동안 공유 허용
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
    }
    if(permission == LocationPermission.deniedForever){
      return;
    }
    if(permission == LocationPermission.whileInUse || permission == LocationPermission.always){          // 앱 사용하는 동안 허용
      getCurrentLocation();
    }
  }

  void getCurrentLocation()async{
    Position position = await Geolocator.getCurrentPosition();
    currentPosition = position;       // 이로써 위도 경도 데이터 받아옴
    canRun = true;
    latData = currentPosition.latitude;     // 위도
    longData = currentPosition.longitude;   // 경도
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: canRun
      ? flutterMap()
      : Center(child: CircularProgressIndicator(),)
      ,
    );
  } // build

  // Widget
  Widget flutterMap(){
    return  FlutterMap(

      mapController: mapController,
      options: MapOptions(
      initialCenter: latlng.LatLng(latData, longData), initialZoom: 13.0  // 초기 첫 화면 위치
      ),
      children: [
        TileLayer(
        urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
        userAgentPackageName: 'com.mega.gpsmapapp',
        ),
        MarkerLayer(
          markers: [
            // 혜화문
            makeMarker(castle[0][0], castle[0][1], castle[0][2], Colors.red),
            // 흥인지문
            makeMarker(castle[1][0], castle[1][1], castle[1][2], Colors.blue),
            // 창의문
            makeMarker(castle[2][0], castle[2][1], castle[2][2], Colors.brown),
            // 숙정문
            makeMarker(castle[3][0], castle[3][1], castle[3][2], Colors.black),
          ]
        ),
      ],
    );
  }
  // ---- Widget Function -----
  Marker makeMarker(String name, double mlat, double mLong, Color mColor){
    return Marker(
      width: 80,
      height: 80,
      point: latlng.LatLng(mlat, mLong),
      child: Column(
        children: [
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Icon(
            Icons.pin_drop,
            size: 50,
            color: mColor,
          ),
        ],
      )
    );
  } 
} // class