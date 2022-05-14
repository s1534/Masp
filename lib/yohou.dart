import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';

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
  var url = "https://www.city.ikoma.lg.jp/0000021551.html";
  var city = "生駒市";

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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
        child: Center(
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
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 120,
                    height: 60,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(
                        Icons.tag_faces,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                  ),
                  Container(
                      child: Text(
                    "${(_hare / (_ame + _hare) * 100).ceil()}%",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                  Container(
                    width: 120,
                    height: 60,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.masks,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                child: Center(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: "$cityのCOVIT-19感染状況は",
                        style: TextStyle(color: Colors.grey[800]),
                      ),
                      TextSpan(
                          text: 'こちら',
                          style: TextStyle(color: Colors.lightBlue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launch(url);
                            } //
                          ),
                    ])),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
