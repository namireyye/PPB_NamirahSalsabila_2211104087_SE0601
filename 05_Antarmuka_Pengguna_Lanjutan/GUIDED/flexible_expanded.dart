import 'package:flutter/material.dart';

class FlexibleExpandedScreen extends StatelessWidget {
  const FlexibleExpandedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flexible & Expanded'),
        backgroundColor: const Color.fromARGB(235, 159, 232, 171),
      ),
      body: Column(
        children: [
          const Text('Flexible'),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                width: 50,
                height: 100,
                color: const Color.fromARGB(255, 135, 235, 236),
              ),
              Flexible(
                child: Container(
                  height: 100,
                  color: const Color.fromARGB(255, 148, 203, 235),
                  child: const Text(
                      "This is flexible widget, it will take the remaining space "),
                ),
              ),
              Icon(Icons.sentiment_very_satisfied),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text('Expanded'),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                width: 50,
                height: 100,
                color: const Color.fromARGB(255, 184, 164, 188),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  color: const Color.fromARGB(255, 201, 164, 244),
                  child: Text(
                      'This is Expanded Widget it force the widget to take up all remaining space'),
                ),
              ),
              Icon(Icons.sentiment_very_satisfied),
            ],
          )
        ],
      ),
    );
  }
}