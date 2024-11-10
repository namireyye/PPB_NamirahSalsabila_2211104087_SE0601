import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: ImagePickerExample(),
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
    );
  }
}

class ImagePickerExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.image_outlined),
            SizedBox(width: 10), 
            Text('Latihan Memilih Gambar'), 
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 207, 41, 132),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Placeholder untuk gambar yang dipilih
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Icon(
                Icons.image_outlined,
                size: 100,
                color: Colors.grey[500],
              ),
            ),
            SizedBox(height: 20),

            // Tombol untuk Kamera dan Galeri
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // Fungsi placeholder untuk Kamera
                  },
                  icon: Icon(Icons.camera_alt),
                  label: Text('Camera'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black, backgroundColor: Colors.orange[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: () {
                    // Fungsi placeholder untuk Galeri
                  },
                  icon: Icon(Icons.image),
                  label: Text('Gallery'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black, backgroundColor: Colors.orange[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Tombol Hapus Gambar
            ElevatedButton(
              onPressed: () {
                // Fungsi placeholder untuk Hapus Gambar
              },
              child: Text('Hapus Gambar'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.orange,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
