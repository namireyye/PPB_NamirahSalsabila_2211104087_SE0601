import 'package:flutter/material.dart';

class CustomScrollViewScreen extends StatelessWidget {
  const CustomScrollViewScreen({super.key});

  @override
/*************  ✨ Codeium Command ⭐  *************/
  /// This build method returns a Scaffold widget containing an AppBar widget
  /// and a CustomScrollView widget. The CustomScrollView widget contains a
  /// SliverAppBar widget and a SliverGrid widget. The SliverAppBar widget is
  /// pinned to the top of the screen and has a height of 100 pixels. The
  /// SliverGrid widget displays a grid of 20 items, with each item being a
  /// Container widget with a light blue background color and a text label
  /// showing the item's index. The SliverGrid widget is configured to have a
  /// maximum cross axis extent of 200 pixels, a main axis spacing of 10 pixels,
  /// a cross axis spacing of 10 pixels, and a child aspect ratio of 4.
/******  e565a9ba-45b3-47aa-b159-83780c339b4c  *******/  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliver'),
        backgroundColor: const Color.fromARGB(255, 233, 103, 205),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 100,
            backgroundColor: const Color.fromARGB(255, 218, 76, 76),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Sliver App Bar',
                style: TextStyle(fontSize: 10),
              ),
            ),
          ),

          //   Sliver Grid
          SliverGrid(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: const Color.fromARGB(96, 230, 96, 185),
                  child: Text('Grid Item $index'),
                );
              }, childCount: 20),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 4)),

          // Sliver Fixed List
          SliverFixedExtentList(
            itemExtent: 70.0,
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: const Color.fromARGB(255, 169, 59, 116),
                child: Text('List Item $index'),
              );
            }),
          ),
        ],
      ),
    );
  }
}