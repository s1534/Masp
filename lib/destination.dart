import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Result extends StatelessWidget {
  //int a;
  // Result({required this.a});

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
        child: Column(children: [
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
              Text("する"),
              Spacer(flex: 2),
              Text("しない"),
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
                          return Result();
                        }))
                      })),
          Spacer(flex: 2),
        ]),
      ),
    );
  }
}
