import 'package:flutter/material.dart';

class Receivedmail extends StatelessWidget {
  const Receivedmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Received Mail'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text('유비에게서 온 메일'),
          Text('관우에게서 온 메일'),
          Text('장비에게서 온 메일'),
        ],
      ),
    );
  }
}