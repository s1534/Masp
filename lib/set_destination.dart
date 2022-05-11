import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter/cupertino.dart';
import 'init.dart';

class Set_destination extends StatefulWidget {
  const Set_destination({Key? key}) : super(key: key);

  @override
  State<Set_destination> createState() => _Set_destinationState();
}

class _Set_destinationState extends State<Set_destination> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('生駒市在住'), backgroundColor: Colors.cyan),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                _showModalPicker(context);
              },
              child: const Text(
                'どこに行く？',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(primary: Colors.cyan[200]),
            ),
            Text(
              _selectedItem + 'に',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                );
              },
              child: const Text(
                '確定する',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(primary: Colors.red[200]),
            ),
          ],
        ),
      ),
    );
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

  String _selectedItem = 'none';

  final List<String> _items = [
    '奈良市',
    '生駒市',
    '奈良先端科学技術大学院大学',
    '北陸先端科学技術大学院大学',
    '沖縄先端科学技術大学院大学',
    '大分市',
  ];

  Widget _pickerItem(String str) {
    return Text(
      str,
      style: const TextStyle(fontSize: 20),
    );
  }

  void _onSelectedItemChanged(int index) {
    setState(() {
      _selectedItem = _items[index];
    });
  }
}
