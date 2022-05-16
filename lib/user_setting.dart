import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class UserSettingPage extends StatefulWidget {
  const UserSettingPage({Key? key}) : super(key: key);

  @override
  State<UserSettingPage> createState() => _UserSettingPageState();
}

class _UserSettingPageState extends State<UserSettingPage> {
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
      body: SettingsList(
        sections: [
          SettingsSection(
            title: Text('ユーザー設定'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: Icon(IconData(0xf018, fontFamily: 'MaterialIcons')),
                title: Text('メール'),
                value: Text('asdfgh@gmail.com'),
              ),
              SettingsTile.navigation(
                leading: Icon(IconData(0xf052b, fontFamily: 'MaterialIcons')),
                title: Text('パスワード'),
                value: Text(''),
              ),
            ],
          ),
          SettingsSection(
            title: Text('基本設定'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: Icon(Icons.language),
                title: Text('言語'),
                value: Text('日本語'),
              ),
              SettingsTile.switchTile(
                onToggle: (value) {},
                initialValue: true,
                leading: Icon(IconData(0xf0566, fontFamily: 'MaterialIcons')),
                title: Text('ダークモード'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
