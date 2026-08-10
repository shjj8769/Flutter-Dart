import 'package:flutter/material.dart';

class PortrateMode extends StatefulWidget {
  final bool switchButton;
  const PortrateMode({super.key, required this.switchButton});

  @override
  State<PortrateMode> createState() => _PortrateModeState();
}

class _PortrateModeState extends State<PortrateMode> {
  // Property

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
            style: ElevatedButton.styleFrom(
              backgroundColor: widget.switchButton ? Colors.red : Colors.blue,
              foregroundColor: Colors.white,
            ),
            child: Text(
              widget.switchButton ? "Flutter" : "Hello"
            ),
          ),
        ],
      ),
    );
  } // build

} // class