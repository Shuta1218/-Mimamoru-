import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {

  @override
  void initState(){
    super.initState();
    Future(() async{
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();
      final ref = FirebaseDatabase.instance.ref();
      final sensorTime = await ref.child("sensor_time").get();

      setState(() {
        hal.clear();
        DateTime now = DateTime.now();
        currentTime = '${now.year}年${now.month}月${now.day}日${now.hour}時${now.minute}分${now.second}秒';
        time = sensorTime.child("${now.year}/${now.month}/${now.day}").value.toString()!;
        today = '${now.month}月${now.day}日';
        print(time);

        if(time == "null") {
          DateTime yd = now.subtract(Duration(days: 1));
          time = sensorTime.child("${yd.year}/${yd.month}/${yd.day}").value.toString()!;
          today = '${yd.month}月${yd.day}日';
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
      }
      );
    });
  }

  String currentTime = "";
  String userName = "";
  String targetName = "";
  String time = "";
  String today = "";
  List hal = [""];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orange[400],
        title: const Text('記録履歴',style: TextStyle(fontSize: 30.0)),
      ),
        backgroundColor: Colors.lightBlue[50],
      body: SingleChildScrollView(
        child: Center(
          child: Column(
              children:[

                Container(
                    child: Text(today,style: TextStyle(fontSize: 50.0))
                ),

                ElevatedButton(
                    onPressed: () async{
                      WidgetsFlutterBinding.ensureInitialized();
                      await Firebase.initializeApp();
                      final ref = FirebaseDatabase.instance.ref();
                      final sensorTime = await ref.child("sensor_time").get();

                      setState(() {
                        hal.clear();
                        DateTime now = DateTime.now();
                        currentTime = '${now.year}年${now.month}月${now.day}日${now.hour}時${now.minute}分${now.second}秒';
                        time = sensorTime.child("${now.year}/${now.month}/${now.day}").value.toString()!;
                        today = '${now.month}月${now.day}日';

                        if(time == "null") {
                          DateTime yd = now.subtract(Duration(days: 1));
                          time = sensorTime.child("${yd.year}/${yd.month}/${yd.day}").value.toString()!;
                          today = '${yd.month}月${yd.day}日';
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

                      print("更新成功!!");

                    },
                    child: Text("更新")
                ),

                for(var i = 0; i <= hal.length-1; i++)
                  Card(
                    margin: const EdgeInsets.all(3),
                    elevation: 10,
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.09,
                      width: MediaQuery.of(context).size.width * 0.50,
                      child: Center(
                        child: Text(hal[i],style: TextStyle(fontSize: 40.0),),
                      ),
                    ),
                  ),
              ]
          ),
        ),
      )
    );
  }
}
