import 'package:flutter/material.dart';

class MyTabBar extends StatefulWidget {
  const MyTabBar({super.key});

  @override
  State<MyTabBar> createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Selamat Pagi!'),
            backgroundColor: Colors.white70,
            bottom: const TabBar(tabs: [
              Tab(
                icon: Icon(Icons.home_filled),
                text: "Home",
              ),
              Tab(
                icon: Icon(Icons.camera_enhance_rounded),
                text: "Post",
              ),
              Tab(
                icon: Icon(Icons.account_circle),
                text: "Profile",
              )
            ]),
          ),
          body: const TabBarView(children: [
            Center(
              child: Text('Halaman Home'),
            ),
            Center(
              child: Text('Halaman Post'),
            ),
            Center(
              child: Text('Halaman Profile'),
            )
          ]),
        ));
  }
}