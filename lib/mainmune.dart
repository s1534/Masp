import 'package:flutter/material.dart';
import "set_destination.dart";
import "vote.dart";

class Main_manue extends StatefulWidget {
  const Main_manue({Key? key}) : super(key: key);

  @override
  State<Main_manue> createState() => _Main_manueState();
}

class _Main_manueState extends State<Main_manue> {
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
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Container(
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
                      onPressed: () => {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return Vote();
                        }))
                      },
                      child: Text(
                        '投票',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(300, 30),
                          primary: Colors.orange),
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
                        "おでかけ",
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
        ],
      ),
    );
  }
}
