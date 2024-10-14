import 'package:flutter/material.dart';

class LatihanListView extends StatelessWidget {
  const LatihanListView({super.key});

  @override
  Widget build(BuildContext context) {
  List<Widget> listContainer =[
    Container(
        height: 130,
        color: Colors.amber[600],
        child: const Center(child: Text('Type A')),
    ),
    Container(
        height: 100,
        color: Colors.amber[500],
        child: const Center(child: Text('Type B')),
    ),
    Container(
        height: 120,
        color: Colors.amber[100],
        child: const Center(child: Text('Type C')),
    ),
    Container(
        height: 50,
        color: Colors.amber[50],
        child: const Center(child: Text('Type D')),
    ),
    Container(
        height: 110,
        color: Colors.amber[100],
        child: const Center(child: Text('Type E')),
    )
  ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView'),
        backgroundColor: Colors.cyan,
      ),
      body: ListView.builder(
        itemCount: listContainer.length,
        itemBuilder: (context, index) {
          return listContainer[index];
        },
      )
    );
  }
}