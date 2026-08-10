import 'package:flutter/material.dart';

class LandscapeMode extends StatefulWidget {
  final Function(bool) onSwitched;
  const LandscapeMode({super.key, required this.onSwitched});

  @override
  State<LandscapeMode> createState() => _LandscapeModeState();
}

class _LandscapeModeState extends State<LandscapeMode> {
  // Property
  late bool _switchButton;
  late Color buttonColor;


  @override
  void initState() {
    super.initState();
    _switchButton = false;
    buttonColor = Colors.blue;
    
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              //
            }, 
            child: Text('Flutter'),
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor,
              foregroundColor: Colors.white,
            ),
          ),
          Switch(
            value: _switchButton,
            onChanged: (value) {
              _switchButton = value;
              _switchButtons(value);
              setState(() {});
            },
          ),
        ],
      ),
    );
  }



  // ------------ Function -------------
  void _switchButtons(bool value){

    if(value == true){
        buttonColor = Colors.red;
        widget.onSwitched(value);
    }else {
        buttonColor =  Colors.blue;
        widget.onSwitched(value);
    }

      setState(() {});
  }
}