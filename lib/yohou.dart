import 'package:flutter/material.dart';

class YohouPage extends StatefulWidget {
  const YohouPage({Key? key}) : super(key: key);

  @override
  State<YohouPage> createState() => _YohouPageState();
}

class _YohouPageState extends State<YohouPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text("Masp",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(),
    );
  }
}
