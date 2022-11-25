import 'package:flutter/material.dart';

class Manual extends StatefulWidget {
  const Manual({Key? key}) : super(key: key);

  @override
  State<Manual> createState() => _ManualState();
}

class _ManualState extends State<Manual> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orange[400],
        title: const Text("使い方",style: TextStyle(fontSize: 30.0)),
      ),
      backgroundColor: Colors.lightBlue[50],
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text("使い方"),
            ],
          ),
        ),
      ),
    );
  }
}
