import 'package:flutter/material.dart';
import "set_destination.dart";

class Main_manue extends StatefulWidget {
  const Main_manue({Key? key}) : super(key: key);

  @override
  State<Main_manue> createState() => _Main_manueState();
}

class _Main_manueState extends State<Main_manue> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.cyan),
      body: Container(
        // color: Colors.blueGrey.shade400,
        padding: EdgeInsets.all(100),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                width: 400,
                // height: 50,
                child: ElevatedButton(
                  onPressed: () => {Navigator.pop(context)},
                  child: Text(
                    '投票しましょう',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(300, 30), primary: Colors.orange),
                ),
              ),
              SizedBox(
                width: 300,
                // height: 50,
                child: ElevatedButton(
                  onPressed: () => {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return Set_destination();
                    }))
                  },
                  child: Text(
                    "目的地を選ぶ",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  // style: ElevatedButton.styleFrom(primary: Colors.cyan[200]),
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(30, 30), primary: Colors.cyan),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    //   body: Container(
    //     height: double.infinity,
    //     color: Colors.blueGrey.shade400,
    //     child: Center(
    //       child: RaisedButton(
    //         child: Text('投票します'),
    //         onPressed: () {
    //           // 1つ前に戻る
    //           Navigator.pop(context);
    //         },
    //       ),
    //     ),
    //   ),
    // ); //Scaffold
  }
}
