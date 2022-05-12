import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:flutter/services.dart' show rootBundle;
import './result.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sqflite/sqflite.dart';

class Vote extends StatelessWidget {
  var url = "https://www.city.ikoma.lg.jp/0000021551.html";
  var city = "生駒市";
  var db = openDatabase('test.db');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Vote"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text("あなたはマスクを…",
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
                  onPressed: () =>
                  {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          return Result();
                        }))
                  }
                )
              ),SizedBox(
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
                      onPressed: () =>
                      {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) {
                              return Result();
                            }))
                      }
                  )
              ),
              RichText(
                text: TextSpan(
                  children: [
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
                        }//
                    ),
                  ]
                )
              ),
            ]
          )
        )
    );
  }
}