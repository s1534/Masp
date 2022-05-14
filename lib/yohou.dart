import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class YohouPage extends StatefulWidget {
  const YohouPage({Key? key}) : super(key: key);

  @override
  State<YohouPage> createState() => _YohouPageState();
}

class _YohouPageState extends State<YohouPage> {
  var _city = "生駒市";
  var _weather = "晴れ";
  double _hare = 250;
  double _ame = 50;
  DateTime now = DateTime.now();
  DateFormat outputFormat = DateFormat('MM/dd');
  var iconcode = [0xf0575, 0xe16f, 0xe0d6];
  var colornum = [
    [255, 244, 38, 38],
    [255, 187, 190, 194],
    [255, 51, 127, 220]
  ];
  var index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          _city,
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Container(
                  child: Text(
                    "今日(" + outputFormat.format(now) + ")",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Container(
                  child: Column(
                children: [
                  Icon(
                    IconData(iconcode[index], fontFamily: 'MaterialIcons'),
                    size: 150,
                    color: Color.fromARGB(
                        colornum[index][0],
                        colornum[index][1],
                        colornum[index][2],
                        colornum[index][3]),
                  ),
                ],
              )),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Container(
                  child: Text(
                    "マスク予報 : " + _weather,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  width: _hare,
                  height: 30,
                  //color: Colors.red,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(15),
                    ),
                  ),
                ),
                Container(
                  width: _ame,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(15),
                    ),
                  ),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
