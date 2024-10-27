import 'package:flutter/material.dart';
import 'package:guided_6/myTabbar.dart';
import 'package:guided_6/mypackage.dart';

class MyBottomTab extends StatefulWidget {
  const MyBottomTab({super.key});

  @override
  State<MyBottomTab> createState() => _MyBottomTabState();
}

class _MyBottomTabState extends State<MyBottomTab> {
  int _currentIndex = 0;

  static const List<Widget> _page = <Widget>[
    MyTabBar(),
    Mypackage(),
    Mypackage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Navbar'),
        centerTitle: true,
      ),
      body: _page[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.camera_enhance_rounded), label: "Post"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box_rounded), label: "Account")
        ],
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        selectedItemColor: const Color.fromARGB(255, 158, 24, 15),
      ),
    );
  }
}