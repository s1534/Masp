import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'mainmune.dart';
import 'set_destination.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      // appBar: AppBar(
      //   // Here we take the value from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   title: Text(widget.title),
      // ),
      body: Container(
        // color: Colors.blueGrey.shade400,
        padding: EdgeInsets.all(100),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                // width: 300,
                // height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Main_manue()),
                    );
                  },
                  child: Text(
                    'メインメニュー222',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.red[200]),
                ),
              ),
              SizedBox(
                // width: 200,
                // height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Set_destination()),
                    );
                  },
                  child: Text(
                    "地域選択画面",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.blue[200]),
                ),
              ),
            ],
          ),
        ),
      ),

      // body: ListView(
      //   //【ListView】複数のウィジェットを表示できるウィジェット。画面からはみ出たらスクロールで表示できる。
      //   children: <Widget>[
      //     ListTile(
      //       //【ListTile】リストの１項目を表示するためのウィジェット
      //       leading: Icon(Icons.security),
      //       //（leading）左端に何を表示するかを決めるプロパティ
      //       title: Text("tmp1"), //（title）項目のタイトルを決めるプロパティ
      //     ),
      //     Divider(), //区切り線を表示してくれるWidget。

      //     ListTile(
      //       leading: Icon(Icons.security),
      //       title: Text("tmp2"),
      //     ),
      //     Divider(), //区切り線を表示してくれるWidget。

      //     ListTile(
      //       leading: Icon(Icons.security),
      //       title: Text("tmp3"),
      //     ),
      //   ],
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
=======
import 'package:fl_chart/fl_chart.dart';

class Result extends StatelessWidget {
  //int a;
  // Result({required this.a});
  var city = "生駒市";

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
      body: Center(
        child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //mainAxisSize: MainAxisSize.min,
            //dding: const EdgeInsets.all(100),
            children: [
              Spacer(flex: 2),
              SizedBox(
                  width: 500,
                  height: 300,
                  child: BarChart(
                    BarChartData(
                        titlesData: FlTitlesData(
                            bottomTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false)),
                            topTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false))),
                        borderData: FlBorderData(
                          border: const Border(
                            top: BorderSide.none,
                            right: BorderSide.none,
                            left: BorderSide(width: 1),
                            bottom: BorderSide(width: 1),
                          ),
                        ),
                        groupsSpace: 10,
                        barGroups: [
                          BarChartGroupData(x: 1, barRods: [
                            BarChartRodData(toY: 24, width: 30),
                          ]),
                          BarChartGroupData(x: 2, barRods: [
                            BarChartRodData(toY: 9, width: 30),
                          ]),
                        ]),
                  )),
              //Spacer(flex: 2),
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Spacer(flex: 7),
                  Text("する",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                  Spacer(flex: 2),
                  Text("しない",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                  Spacer(flex: 7),
                ],
              ),
              Spacer(flex: 1),
              SizedBox(
                  width: 200,
                  height: 100,
                  child: ElevatedButton.icon(
                      icon: const Icon(
                        Icons.house,
                        color: Colors.white,
                      ),
                      label: const Text("メニューに戻る"),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        onPrimary: Colors.black,
                      ),
                      onPressed: () => {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return Result(); //メインメニューに書き換えること
                            }))
                          })),
              Spacer(flex: 2),
            ]),
      ),
>>>>>>> main
    );
  }
}
