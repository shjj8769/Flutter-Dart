import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  XFile? imageFile;   // 선택할수도 취소할수도 있어서 null ?
  final ImagePicker picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery & Camera'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      getImageFromDevice(ImageSource.gallery);       // 이미지 가져오기
                    }, 
                    child: Text('Gallery'),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      getImageFromDevice(ImageSource.camera);
                    }, 
                    child: Text('Camera'),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: imageFile == null
                ? Text('Image is not selected!')
                : Image.file(File(imageFile!.path))
                ,
              ),
            ),
          ],
        ),
      ),
    );
  } // build



  // ========== Function =============
  void getImageFromDevice(ImageSource imageSource)async{
    final XFile? pickedFile = await picker.pickImage(source: imageSource);
    if(pickedFile == null){
      imageFile = null;
    }else{
      imageFile = XFile(pickedFile.path);
    }
    setState(() {});
  }
} // class