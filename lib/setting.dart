import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:testmasp/init.dart';
import 'package:testmasp/mainmune.dart';
import 'package:flutter/cupertino.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  // メッセージ表示用
  String infoText = '';
  // 入力したメールアドレス・パスワード
  String email = '';
  String password = '';

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 200, 0, 0),
          child: Column(children: [
            Container(
              width: 150,
              height: 150,
              child: (Image.asset('assets/images/masp.png')),
            ),
            Text("MEMBER LOGIN",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
            Center(
              child: Container(
                padding: EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // メールアドレス入力
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                              color: Colors.blue,
                              width: 2.0,
                            ),
                          ),
                          labelStyle: TextStyle(
                            fontSize: 12,
                            color: Colors.blue,
                          ),
                          labelText: 'Emailアドレス',
                          prefixIcon: Icon(
                              IconData(0xf018, fontFamily: 'MaterialIcons')),
                          floatingLabelStyle: const TextStyle(fontSize: 12),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: Colors.blue[100]!,
                              width: 1.0,
                            ),
                          ),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            email = value;
                          });
                        },
                      ),
                    ),
                    // パスワード入力
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                              color: Colors.blue,
                              width: 2.0,
                            ),
                          ),
                          labelStyle: TextStyle(
                            fontSize: 12,
                            color: Colors.blue,
                          ),
                          labelText: 'パスワード',
                          prefixIcon: Icon(
                              IconData(0xf052b, fontFamily: 'MaterialIcons')),
                          floatingLabelStyle: const TextStyle(fontSize: 12),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: Colors.blue[100]!,
                              width: 1.0,
                            ),
                          ),
                        ),
                        obscureText: true,
                        onChanged: (String value) {
                          setState(() {
                            password = value;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      //width: double.infinity,
                      // ログイン登録ボタン
                      child: ElevatedButton(
                        child: const Text('LOGIN'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          onPrimary: Colors.black,
                          shape: const StadiumBorder(),
                        ),
                        onPressed: () async {
                          try {
                            // メール/パスワードでログイン
                            final FirebaseAuth auth = FirebaseAuth.instance;
                            await auth.signInWithEmailAndPassword(
                              email: email,
                              password: password,
                            );
                            // ログインに成功した場合
                            // チャット画面に遷移＋ログイン画面を破棄
                            await Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) {
                                return Main_manue();
                              }),
                            );
                          } catch (e) {
                            // ログインに失敗した場合
                            setState(() {
                              showDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (_) {
                                  return CupertinoAlertDialog(
                                    title: Text("ログイン失敗"),
                                    content: Text("${e.toString()}"),
                                    actions: [
                                      FlatButton(
                                        child: Text("OK"),
                                        onPressed: () => Navigator.pop(context),
                                      ),
                                    ],
                                  );
                                },
                              );
                            });
                          }
                        },
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      // ユーザー登録ボタン
                      child: ElevatedButton(
                        child: Text('ユーザー登録'),
                        onPressed: () async {
                          try {
                            // メール/パスワードでユーザー登録
                            final FirebaseAuth auth = FirebaseAuth.instance;
                            await auth.createUserWithEmailAndPassword(
                              email: email,
                              password: password,
                            );
                            // ユーザー登録に成功した場合
                            // チャット画面に遷移＋ログイン画面を破棄
                            await Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) {
                                return Main_manue();
                              }),
                            );
                          } catch (e) {
                            // ユーザー登録に失敗した場合
                            setState(() {
                              infoText = "登録に失敗しました"; //}：${e.toString()}";
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
