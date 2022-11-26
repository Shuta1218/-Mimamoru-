import 'package:flutter/material.dart';
import 'package:mimamoru/src/Screens/setting.dart';
import 'screens/history.dart';
import 'screens/home.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  static  final _screens = [
    const Home(),
    const History(),
    const Setting(),
  ];

  int _selectedIndex = 0;


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ホーム'),
            BottomNavigationBarItem(icon: Icon(Icons.history), label: '記録履歴'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: '設定'),
          ],
          type: BottomNavigationBarType.fixed,
        ));
  }
}