import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'destination.dart';
import 'init.dart';
import 'dart:async';

class Set_destination extends StatefulWidget {
  const Set_destination({Key? key}) : super(key: key);

  @override
  State<Set_destination> createState() => _Set_destinationState();
}

class _Set_destinationState extends State<Set_destination> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(34.70834090180336, 135.71010105867856),
    zoom: 10,
  );
  static final CameraPosition _kLake = CameraPosition(
    target: LatLng(34.660918499112995, 135.50560491669046),
    zoom: 10,
  );
  Set<Marker> _markers = {
    Marker(
      markerId: MarkerId("marker1"),
      position: LatLng(34.70834090180336, 135.71010105867856),
      infoWindow: InfoWindow(title: "生駒市", snippet: "感染者数:1000人"),
    ),
    Marker(
      markerId: MarkerId("marker2"),
      position: LatLng(34.68475887695935, 135.80507809188992),
      infoWindow: InfoWindow(title: "奈良市", snippet: "感染者数:1000人"),
    ),
    Marker(
      markerId: MarkerId("marker3"),
      position: LatLng(34.65011737829483, 135.78182489913343),
      infoWindow: InfoWindow(title: "大和郡山市", snippet: "感染者数:2000人"),
    ),
    Marker(
      markerId: MarkerId("marker4"),
      position: LatLng(34.509917218876275, 135.74332269797887),
      infoWindow: InfoWindow(title: "大和高田市", snippet: "感染者数:2000人"),
    ),
    Marker(
      markerId: MarkerId("marker5"),
      position: LatLng(34.59587111226869, 135.86332156618963),
      infoWindow: InfoWindow(title: "天理市", snippet: "感染者数:2000人"),
    ),
    Marker(
      markerId: MarkerId("marker6"),
      position: LatLng(34.50118465050398, 135.78845909751686),
      infoWindow: InfoWindow(title: "橿原市", snippet: "感染者数:2000人"),
    ),
    Marker(
      markerId: MarkerId("marker7"),
      position: LatLng(34.52204589818176, 135.87868264444927),
      infoWindow: InfoWindow(title: "桜井市", snippet: "感染者数:2000人"),
    ),
    Marker(
      markerId: MarkerId("marker8"),
      position: LatLng(34.35944201747558, 135.69231863372528),
      infoWindow: InfoWindow(title: "五條市", snippet: "感染者数:2000人"),
    ),
    Marker(
      markerId: MarkerId("marker9"),
      position: LatLng(34.43373905886754, 135.72256175634035),
      infoWindow: InfoWindow(title: "御所市", snippet: "感染者数:2000人"),
    ),
    Marker(
      markerId: MarkerId("marker10"),
      position: LatLng(34.549053380627804, 135.68928430063434),
      infoWindow: InfoWindow(title: "香芝市", snippet: "感染者数:2000人"),
    ),
  };

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
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Container(
                height: 100.0,
                width: 200.0,
                child: Text(
                  _selectedItem,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              height: 400.0,
              width: 400.0,
              child: GoogleMap(
                markers: _markers,
                mapType: MapType.normal,
                initialCameraPosition: _kLake,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ),
            // Expanded(child: Image.asset('assets/images/destination_trans.png')),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Container(
                // height: 140,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 13),
                    ),
                    SizedBox(
                      width: 160,
                      height: 80,
                      child: ElevatedButton(
                        onPressed: () {
                          _showModalPicker(context);
                          flag = true;
                          print("aaaa");
                        },
                        child: const Text(
                          'どこに行く？',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(primary: Colors.cyan),
                      ),
                    ),
                    SizedBox(width: 22),
                    SizedBox(
                      width: 150,
                      height: 80,
                      child: ElevatedButton.icon(
                        onPressed: !flag
                            ? null
                            : () {
                                Navigator.of(context).push(
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation,
                                        secondaryAnimation) {
                                      return Result();
                                    },
                                    transitionsBuilder: (context, animation,
                                        secondaryAnimation, child) {
                                      final double begin = 0.0;
                                      final double end = 1.0;
                                      final Animatable<double> tween =
                                          Tween(begin: begin, end: end).chain(
                                              CurveTween(
                                                  curve: Curves.easeInOut));
                                      final Animation<double> doubleAnimation =
                                          animation.drive(tween);
                                      return FadeTransition(
                                        opacity: doubleAnimation,
                                        child: child,
                                      );
                                    },
                                  ),
                                );
                                // 何かEnableの時の処理
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => Result()),
                                // );
                              },
                        label: Text(
                          '確定する',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        icon: Icon(Icons.directions_walk_outlined,
                            size: 40, color: Colors.white),
                        style: ElevatedButton.styleFrom(primary: Colors.orange),
                      ),
                    ),
                  ],
                ),
              ),
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
              print(flag);
              _goToAnywhere();
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

  Future<void> _goToAnywhere() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kGooglePlex));
  }

  void _onSelectedItemChanged(int index) {
    setState(() {
      _selectedItem = _items[index];
    });
  }
}
