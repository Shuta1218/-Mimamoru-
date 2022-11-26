import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String upDate = "";

  @override
  void initState(){
    super.initState();
    Future(() async{
      final prefs = await SharedPreferences.getInstance();
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();
      final ref = FirebaseDatabase.instance.ref();
      final sensorTime = await ref.child("sensor_time").get();

      targetName = prefs.getString('watchTarget') ?? "見守り対象がいません";

      setState(() {
        DateTime now = DateTime.now();

        currentTime = '${now.year}年${now.month}月${now.day}日${now.hour}時${now.minute}分${now.second}秒';
        if (kDebugMode) {
          print('--------------------------------------------------');
          print(currentTime);
          print('--------------------------------------------------');
        }
        time = sensorTime.child("${now.year}/${now.month}/${now.day}").value.toString();
        if (kDebugMode) {
          print(time);
        }

        if(time == "null") {
          DateTime yd = now.subtract(const Duration(days: 1));
          time = sensorTime.child("${yd.year}/${yd.month}/${yd.day}").value.toString();
        }

        time = time.replaceAll("{", "");
        time = time.replaceAll("}", "");
        time = time.replaceAll(" ", "");
        var result = time.split(',');

        for(var i = 0; i <= result.length-1; i++){
          final t = result[i].substring(0,8);
          hal.add(t);
        }
        hal.sort((a, b) => -a.compareTo(b));

        hal_len = hal.length-1;

        if (kDebugMode) {
          print(targetName);
          print(hal_len);
          print(hal_len.runtimeType);
        }

        hal_Len = hal_len.toString();

        if (kDebugMode) {
          print(hal_Len.runtimeType);
        }


      });
    });
  }

  String currentTime = "";
  String userName = "";
  String targetName = "";
  String time = "";
  List hal = [""];
  var hal_len ;
  String hal_Len = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orange[400],
        title: const Text('ホーム',style: TextStyle(fontSize: 30.0)),
      ),
        backgroundColor: Colors.lightBlue[50],
      body: RefreshIndicator(
        onRefresh: () async{
          Future(() async{
            await Future.delayed(const Duration(seconds: 3));
            final prefs = await SharedPreferences.getInstance();
            WidgetsFlutterBinding.ensureInitialized();
            await Firebase.initializeApp();
            final ref = FirebaseDatabase.instance.ref();
            final sensorTime = await ref.child("sensor_time").get();

            userName = prefs.getString('username')  ?? "ユーザー名の取得に失敗しました";
            targetName = prefs.getString('watchTarget') ?? "見守り対象の取得に失敗しました";

            setState(() {
              DateTime now = DateTime.now();

              currentTime = '${now.year}年${now.month}月${now.day}日${now.hour}時${now.minute}分${now.second}秒';
              if (kDebugMode) {
                print('--------------------------------------------------');
                print(currentTime);
                print('--------------------------------------------------');
              }
              time = sensorTime.child("${now.year}/${now.month}/${now.day}").value.toString();
              if (kDebugMode) {
                print(time);
              }

              // while(time == "null") {
              //   DateTime yd = now.subtract(Duration(days: 1));
              // }


              time = time.replaceAll("{", "");
              time = time.replaceAll("}", "");
              time = time.replaceAll(" ", "");
              var result = time.split(',');

              for(var i = 0; i <= result.length-1; i++){
                final t = result[i].substring(0,8);
                hal.add(t);
              }
              hal.sort((a, b) => -a.compareTo(b));
              hal_len = hal.length-1;
              hal_Len = hal_len.toString();

            });
          });
        },
        child: Container(
          // color: Colors.lightBlue,
          height: MediaQuery.of(context).size.height * 0.79,
          padding: const EdgeInsets.all(0.0),
          child: Column(
            children: [

              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.20,
              // ),

              SizedBox(
                width: MediaQuery.of(context).size.width * 1.00,
                height: MediaQuery.of(context).size.height * 0.35,
                child: Card(
                  margin: const EdgeInsets.all(20),
                  elevation: 10,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text('見守り対象',style: TextStyle(fontSize: 20.0)),
                        subtitle: Text(targetName,style:const TextStyle(fontSize: 30.0)),
                      ),
                      const Text('反応した時間',style: TextStyle(fontSize: 32.0)),
                      Text(hal[0],style: const TextStyle(fontSize: 50.0))
                    ],
                  ),
                ),
              ),

              SizedBox(
                width: MediaQuery.of(context).size.width * 1.00,
                height: MediaQuery.of(context).size.height * 0.18,
                child: Card(
                  margin: const EdgeInsets.all(20),
                  elevation: 10,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      const Text('今日反応した回数',style: TextStyle(fontSize: 32.0)),
                      Text(hal_Len,style: const TextStyle(fontSize: 50.0))
                    ],
                  ),
                ),
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    // ボタン内でinitState()内を実行してるから上のinitState()をコピーすればおk
                      onPressed: () async{
                        final prefs = await SharedPreferences.getInstance();
                        WidgetsFlutterBinding.ensureInitialized();
                        await Firebase.initializeApp();
                        final ref = FirebaseDatabase.instance.ref();
                        final sensorTime = await ref.child("sensor_time").get();

                        targetName = prefs.getString('watchTarget') ?? "対象がいません";

                        setState(() {
                          DateTime now = DateTime.now();

                          currentTime = '${now.year}年${now.month}月${now.day}日${now.hour}時${now.minute}分${now.second}秒';
                          time = sensorTime.child("${now.year}/${now.month}/${now.day}").value.toString();

                          if(time == "null") {
                            DateTime yd = now.subtract(const Duration(days: 1));
                            time = sensorTime.child("${yd.year}/${yd.month}/${yd.day}").value.toString();
                          }

                          time = time.replaceAll("{", "");
                          time = time.replaceAll("}", "");
                          time = time.replaceAll(" ", "");
                          var result = time.split(',');

                          for(var i = 0; i <= result.length-1; i++){
                            final t = result[i].substring(0,8);
                            hal.add(t);
                          }
                          hal.sort((a, b) => -a.compareTo(b));

                        });
                      },
                    child: const Text("更新"),

                  ),
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}
