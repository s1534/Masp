import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:flutter/services.dart' show rootBundle;
import 'main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';

//import 'package:firebase_core/firebase_core.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
class Vote extends StatefulWidget {
  const Vote({Key? key}) : super(key: key);

  @override
  State<Vote> createState() => _Vote();
}

class _Vote extends State<Vote> {
  var url = "https://www.city.ikoma.lg.jp/0000021551.html";
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
              Text(
                "あなたはマスクを…",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(
                  width: 200,
                  height: 200,
                  child: ElevatedButton.icon(
                      icon: const Icon(
                        Icons.masks,
                        color: Colors.white,
                      ),
                      label: const Text("する"),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        onPrimary: Colors.black,
                      ),
                      onPressed: () => {
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) {
                                  return Result();
                                },
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  final double begin = 0.0;
                                  final double end = 1.5;
                                  final Animatable<double> tween =
                                      Tween(begin: begin, end: end).chain(
                                          CurveTween(curve: Curves.easeInOut));
                                  final Animation<double> doubleAnimation =
                                      animation.drive(tween);
                                  return FadeTransition(
                                    opacity: doubleAnimation,
                                    child: child,
                                  );
                                },
                              ),
                            )
                          })),
              SizedBox(
                  width: 200,
                  height: 200,
                  child: ElevatedButton.icon(
                      icon: const Icon(
                        Icons.tag_faces,
                        color: Colors.white,
                      ),
                      label: const Text("しない"),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        onPrimary: Colors.black,
                      ),
                      onPressed: () => {
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) {
                                  return Result();
                                },
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  final double begin = 0.0;
                                  final double end = 1.5;
                                  final Animatable<double> tween =
                                      Tween(begin: begin, end: end).chain(
                                          CurveTween(curve: Curves.easeInOut));
                                  final Animation<double> doubleAnimation =
                                      animation.drive(tween);
                                  return FadeTransition(
                                    opacity: doubleAnimation,
                                    child: child,
                                  );
                                },
                              ),
                            )
                            // Navigator.of(context)
                            //     .push(MaterialPageRoute(builder: (context) {
                            //   return Result();
                            // }))
                          })),
              RichText(
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
            ])));
  }
}
