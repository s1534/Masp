import 'package:flutter/material.dart';
import 'package:testmasp/user_setting.dart';
import "set_destination.dart";
import "yohou.dart";
import "user_setting.dart";
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 100, 0, 20),
            child: RowButton(context),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: RowButton2(context),
          ),
        ],
      ),
    );
  }

  Row RowButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
          child: SizedBox(
            width: 150,
            height: 150,
            child: ElevatedButton(
              onPressed: () => {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return Vote();
                    },
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      final double begin = 0.0;
                      final double end = 1.0;
                      final Animatable<double> tween =
                          Tween(begin: begin, end: end)
                              .chain(CurveTween(curve: Curves.easeInOut));
                      final Animation<double> doubleAnimation =
                          animation.drive(tween);
                      return FadeTransition(
                        opacity: doubleAnimation,
                        child: child,
                      );
                    },
                  ),
                )
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Column(
                  children: [
                    Text(
                      'マスク投票',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                        IconData(
                          0xea26,
                          fontFamily: 'MaterialIcons',
                        ),
                        size: 80)
                  ],
                ),
              ),
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(300, 30), primary: Colors.orange),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
          child: SizedBox(
            width: 150,
            height: 150,
            child: ElevatedButton(
              onPressed: () => {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return Set_destination();
                    },
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      final double begin = 0.0;
                      final double end = 1.0;
                      final Animatable<double> tween =
                          Tween(begin: begin, end: end)
                              .chain(CurveTween(curve: Curves.easeInOut));
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
                //   return Set_destination();
                // }))
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Column(
                  children: [
                    Text(
                      "おでかけ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(IconData(0xf1ae, fontFamily: 'MaterialIcons'),
                        size: 80)
                  ],
                ),
              ),
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(30, 30), primary: Colors.cyan),
            ),
          ),
        ),
      ],
    );
  }
}

Row RowButton2(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
        child: SizedBox(
          width: 150,
          height: 150,
          child: ElevatedButton(
            onPressed: () => {
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return YohouPage();
                  },
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    final double begin = 0.0;
                    final double end = 1.0;
                    final Animatable<double> tween =
                        Tween(begin: begin, end: end)
                            .chain(CurveTween(curve: Curves.easeInOut));
                    final Animation<double> doubleAnimation =
                        animation.drive(tween);
                    return FadeTransition(
                      opacity: doubleAnimation,
                      child: child,
                    );
                  },
                ),
              )
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Column(
                children: [
                  Text(
                    'マスク予報',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(IconData(0xf1b9, fontFamily: 'MaterialIcons'), size: 100)
                ],
              ),
            ),
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(300, 30), primary: Colors.orange),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
        child: SizedBox(
          width: 150,
          height: 150,
          child: ElevatedButton(
            onPressed: () => {
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return UserSettingPage();
                  },
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    final double begin = 0.0;
                    final double end = 1.0;
                    final Animatable<double> tween =
                        Tween(begin: begin, end: end)
                            .chain(CurveTween(curve: Curves.easeInOut));
                    final Animation<double> doubleAnimation =
                        animation.drive(tween);
                    return FadeTransition(
                      opacity: doubleAnimation,
                      child: child,
                    );
                  },
                ),
              )
              // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              //   return UserSettingPage();
              // }))
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "ユーザー設定",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Icon(IconData(0xe57f, fontFamily: 'MaterialIcons'), size: 80)
                ],
              ),
            ),
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(30, 30), primary: Colors.cyan),
          ),
        ),
      ),
    ],
  );
}
