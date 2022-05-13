import 'package:flutter/material.dart';

class UserSettingPage extends StatefulWidget {
  const UserSettingPage({Key? key}) : super(key: key);

  @override
  State<UserSettingPage> createState() => _UserSettingPageState();
}

class _UserSettingPageState extends State<UserSettingPage> {
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
