import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {

  dynamic dateTime;
  dynamic dateOnly;
  dynamic sensorTime;

  @override
  void initState() {
    super.initState();
    Future(() async {
      await Firebase.initializeApp();
      final ref = FirebaseDatabase.instance.ref();
      hal.clear();
      sensorTime = await ref.child("sensor_time").get();
      dateTime = DateTime.now();
      dateOnly = '${dateTime.year}年${dateTime.month}月${dateTime.day}日';
      setState(() {
        //awaitで非同期にしてFirebaseから値を取得するまで待ってる(awaitにはasyncが必須)
        time = sensorTime.child("${dateTime.year}/${dateTime.month}/${dateTime.day}").value.toString();

        time = time.replaceAll("{", "");
        time = time.replaceAll("}", "");
        time = time.replaceAll(" ", "");
        var result = time.split(',');

        for(var i = 0; i <= result.length-1; i++){
          final t = result[i].substring(0,8);
          hal.add(t);
        }

        hal.sort((a, b) => -a.compareTo(b));

        if (kDebugMode) {
          print(dateTime);
          print(dateOnly);
          print(time);
        }
      });
    });
  }

  Future _datePicker(BuildContext context) async {
    final DateTime? datePicked = await showDatePicker(
        context: context,
        initialDate: dateTime,
        firstDate: DateTime(2022),
        lastDate: DateTime(2032),
    );
    if (datePicked != null && datePicked != dateTime) {
      setState(() {
        dateTime = datePicked;
        dateOnly = '${dateTime.year}/${dateTime.month}/${dateTime.day}' ;
        hal.clear();
        time = sensorTime.child("${dateTime.year}/${dateTime.month}/${dateTime.day}").value.toString();

        if(time != "null"){
          time = time.replaceAll("{", "");
          time = time.replaceAll("}", "");
          time = time.replaceAll(" ", "");
          // print(time);
          var result = time.split(',');

          for(var i = 0; i <= result.length-1; i++){
            // print(result[i]);
            final t = result[i].substring(0,8);
            hal.add(t);
          }

          hal.sort((a, b) => -a.compareTo(b));
        }else{
          hal.add("記録なし");
        }

      });
    }
  }

  String time = "";
  List hal = [""];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orange[400],
        title: const Text("カレンダー",style: TextStyle(fontSize: 30.0)),
      ),
      backgroundColor: Colors.lightBlue[50],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children:[
              const Text("カレンダー",style: TextStyle(fontSize: 40.0)),

              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  ElevatedButton(
                    onPressed: () {
                      _datePicker(context);
                    },
                    child: const Text("日付を選択"),
                  ),

                  Text("$dateOnly",style: const TextStyle(fontSize: 40.0)),

                  // for(var i = 0; i <= hal.length-1; i++)


                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    // padding: const EdgeInsets.all(1),
                    itemCount: hal.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        margin: const EdgeInsets.only(top: 6,right: 100,left: 100),
                        elevation: 10,
                        shadowColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.50,
                          height: MediaQuery.of(context).size.height * 0.09,
                          child: Center(
                              child: Text('${hal[index]}',style: const TextStyle(fontSize: 40.0))
                          ),
                        ),
                      );
                    }
                  ),
                ]
              )
            ],
          ),
        ),
      ),
    );
  }
}