import 'package:flutter/material.dart';
import '../db/database_helper.dart';
import '../models/mahasiswa.dart';
import 'add_mahasiswa_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Mahasiswa> _mahasiswaList = [];

  void _refreshMahasiswaList() async {
    final data = await DatabaseHelper().getMahasiswaList();
    setState(() {
      _mahasiswaList = data;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshMahasiswaList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biodata Mahasiswa', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: _mahasiswaList.isEmpty
          ? Center(
              child: Text(
                'Belum ada data mahasiswa.',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 18,
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: _mahasiswaList.length,
              itemBuilder: (context, index) {
                final mahasiswa = _mahasiswaList[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          mahasiswa.nama,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal[900],
                          ),
                        ),
                        SizedBox(height: 8),
                        Text('NIM: ${mahasiswa.nim}'),
                        Text('Alamat: ${mahasiswa.alamat}'),
                        Text('Hobi: ${mahasiswa.hobi}'),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddMahasiswaScreen()),
          );
          if (result == true) {
            _refreshMahasiswaList();
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
