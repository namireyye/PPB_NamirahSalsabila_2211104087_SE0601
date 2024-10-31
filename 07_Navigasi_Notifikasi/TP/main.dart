import 'package:flutter/material.dart';

/// Main function to run the app
void main() {
  runApp(MyApp());
}

/// Root of the application
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigasi App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HalamanPertama(), // Set 'HalamanPertama' as the home screen
    );
  }
}

/// HalamanPertama Widget
class HalamanPertama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Pertama"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to HalamanKedua when button is pressed
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HalamanKedua()),
            );
          },
          child: Text("Pindah ke Halaman Kedua"),
        ),
      ),
    );
  }
}

/// HalamanKedua Widget
class HalamanKedua extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Kedua"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to HalamanPertama when button is pressed
            Navigator.pop(context);
          },
          child: Text("Kembali ke Halaman Pertama"),
        ),
      ),
    );
  }
}
