import 'package:flutter/material.dart';

void main() {
  runApp(WisataApp());
}

class WisataApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rekomendasi Wisata',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Wisata(),
    );
  }
}

class Wisata extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 11, 178, 255),
        title: Align(
            alignment: Alignment.center,
            child: Text(
              "Rekomendasi Wisata",
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Pantai Anyer',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Image.network(
              'https://static.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/p1/945/2023/11/03/Screenshot_2023_1103_212946-2909976863.jpg',
              height: 200,
              width: 300,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              'Pantai Anyer terletak di Provinsi Banten dan menjadi salah satu destinasi wisata populer di Indonesia. Pantai ini terkenal dengan pasir putihnya yang halus serta pemandangan matahari terbenam yang menakjubkan. Selain itu, wisatawan dapat menikmati berbagai aktivitas seperti berenang, bermain jet ski, dan berperahu.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Aksi ketika tombol ditekan
              },
              child: Text('Kunjungi Tempat'),
            ),
          ],
        ),
      ),
    );
  }
}