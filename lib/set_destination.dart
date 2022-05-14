import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter/cupertino.dart';
import 'destination.dart';
import 'init.dart';

class Set_destination extends StatefulWidget {
  const Set_destination({Key? key}) : super(key: key);

  @override
  State<Set_destination> createState() => _Set_destinationState();
}

class _Set_destinationState extends State<Set_destination> {
  @override
  bool flag = false;
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 80),
            ),
            Text(
              _selectedItem,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            Expanded(child: Image.asset('assets/images/destination.png')),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 13),
                ),
                SizedBox(
                  width: 190,
                  height: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      _showModalPicker(context);
                    },
                    child: const Text(
                      'どこに行く？',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(primary: Colors.cyan),
                  ),
                ),
                SizedBox(width: 22),
                SizedBox(
                  width: 190,
                  height: 100,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      flag = true;
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Result()),
                      );
                    },
                    label: Text(
                      '確定する',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    icon: Icon(Icons.directions_walk_outlined,
                        size: 40, color: Colors.white),
                    style: ElevatedButton.styleFrom(primary: Colors.orange),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(70),
            ),
          ],
        ),
      ),
    );
  }

  Map<dynamic, dynamic> get goto {
    return {};
  }

  void _showModalPicker(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height / 3,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
              print(flag);
            },
            child: CupertinoPicker(
              itemExtent: 40,
              children: _items.map(_pickerItem).toList(),
              onSelectedItemChanged: _onSelectedItemChanged,
            ),
          ),
        );
      },
    );
  }

  String _selectedItem = '';

  final List<String> _items = [
    '奈良市',
    '生駒市',
    '大和高田市',
    '大和郡山市',
    '天理市',
    '橿原市',
    '桜井市',
    '五條市',
    '御所市',
    '香芝市',
  ];

  Widget _pickerItem(String str) {
    return Text(
      str,
      style: const TextStyle(fontSize: 20),
    );
  }

  // void _goTo(bool flag) {
  //   print(flag);
  // }

  void _onSelectedItemChanged(int index) {
    setState(() {
      _selectedItem = _items[index];
    });
  }
}
