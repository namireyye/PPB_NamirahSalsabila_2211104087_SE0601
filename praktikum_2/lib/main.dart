import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text('This is My First Project Cihuyy',
        //       style:
        //           TextStyle(color: const Color.fromARGB(255, 255, 255, 255))),
        //   backgroundColor: const Color.fromARGB(255, 121, 60, 3),
        //   centerTitle: true,
        // ),
        body: const Center(
          child: Biodata(),
        ),
      ),
    );
  }
}

class Biodata extends StatelessWidget {
  const Biodata({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      color: const Color.fromARGB(255, 102, 59, 9),
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Image(
              image: AssetImage('assets/agam.png'),
              height: 250,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Muhammad Agam Nasywaan',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 206, 206, 206),
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              '2211104085 / SE-06-1',
              style: TextStyle(
                  color: const Color.fromARGB(255, 206, 206, 206),
                  fontSize: 16.0),
            ),
            const SizedBox(height: 4.0),
            const Text(
              'Rekayasa Perangkat Lunak',
              style: TextStyle(
                  color: const Color.fromARGB(255, 206, 206, 206),
                  fontSize: 16.0),
            ),
            const SizedBox(height: 4.0),
            const Text(
              'Telkom University Purwokerto',
              style: TextStyle(
                  color: Color.fromARGB(255, 206, 206, 206), fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}