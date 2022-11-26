import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//キー名を書き込む
// const username = 'name';
// const watchTarget = 'name';


class AccountSetting extends StatefulWidget {
  const AccountSetting({Key? key}) : super(key: key);

  @override
  State<AccountSetting> createState() => _AccountSettingState();
}

class _AccountSettingState extends State<AccountSetting> {
  String watchTarget = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orange[400],
        title: const Text('アカウント',style: TextStyle(fontSize: 30.0)),
      ),
        backgroundColor: Colors.lightBlue[50],
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 16),
                child: TextFormField(
                  maxLength: 10,
                  decoration: const InputDecoration(
                    labelText: '見守り対象を入力してください',
                  ),
                  onChanged: (value){
                    watchTarget = value;
                  },
                ),
              ),

              Center(
                child: ElevatedButton(
                    onPressed: ()async{
                      if(watchTarget != "") {
                        final prefs = await SharedPreferences.getInstance();
                        prefs.setString('watchTarget', watchTarget);
                        Navigator.pop(context);
                      }else{
                        if (kDebugMode) {
                          print('何も入ってない');
                        }
                      }
                    },
                    child: const Text('送信')
                ),
              ),
            ],
          )
        ),
      )
    );
  }
}
