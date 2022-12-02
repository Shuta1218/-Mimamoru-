import 'package:flutter/material.dart';
import 'package:mimamoru/src/Screens/calendar.dart';
import 'package:mimamoru/src/Screens/manual.dart';
import 'package:mimamoru/src/Screens/push_notification.dart';

import '../screens/account_setting.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orange[400],
        title: const Text("設定",style: TextStyle(fontSize: 30.0)),
      ),
      backgroundColor: Colors.lightBlue[50],
      body:Center(
        child: Column(
          children: [

            SizedBox(
              height: MediaQuery.of(context).size.height*0.05,
            ),

            SizedBox(
              width: MediaQuery.of(context).size.width*0.6,

              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const AccountSetting()));
                },

                label: const Text("対象設定",style: TextStyle(fontSize: 30)),

                icon: const Icon(Icons.person),

                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),

            SizedBox(
              width: MediaQuery.of(context).size.width*0.6,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Calendar()));
                },

                label: const Text("カレンダー",style: TextStyle(fontSize: 30)),

                icon: const Icon(Icons.calendar_month),

                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),

            SizedBox(
              width: MediaQuery.of(context).size.width*0.6,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Manual()));
                },

                label: const Text("使い方",style: TextStyle(fontSize: 30)),

                icon: const Icon(Icons.info),

                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),

            SizedBox(
              width: MediaQuery.of(context).size.width*0.6,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const PushNotification()));
                },

                label: const Text("通知設定",style: TextStyle(fontSize: 30)),

                icon: const Icon(Icons.info),

                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
