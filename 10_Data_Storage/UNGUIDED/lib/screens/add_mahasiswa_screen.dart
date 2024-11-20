import 'package:flutter/material.dart';
import '../db/database_helper.dart';
import '../models/mahasiswa.dart';

class AddMahasiswaScreen extends StatefulWidget {
  @override
  _AddMahasiswaScreenState createState() => _AddMahasiswaScreenState();
}

class _AddMahasiswaScreenState extends State<AddMahasiswaScreen> {
  final _formKey = GlobalKey<FormState>();
  String _nama = '';
  String _nim = '';
  String _alamat = '';
  String _hobi = '';

  void _saveMahasiswa() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Mahasiswa mahasiswa = Mahasiswa(
        nama: _nama,
        nim: _nim,
        alamat: _alamat,
        hobi: _hobi,
      );
      await DatabaseHelper().insertMahasiswa(mahasiswa);
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Biodata Mahasiswa'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nama',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.teal[50],
                ),
                onSaved: (value) => _nama = value!,
                validator: (value) =>
                    value!.isEmpty ? 'Nama tidak boleh kosong' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'NIM',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.teal[50],
                ),
                onSaved: (value) => _nim = value!,
                validator: (value) =>
                    value!.isEmpty ? 'NIM tidak boleh kosong' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Alamat',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.teal[50],
                ),
                onSaved: (value) => _alamat = value!,
                validator: (value) =>
                    value!.isEmpty ? 'Alamat tidak boleh kosong' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Hobi',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.teal[50],
                ),
                onSaved: (value) => _hobi = value!,
                validator: (value) =>
                    value!.isEmpty ? 'Hobi tidak boleh kosong' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveMahasiswa,
                child: Text(
                  'Simpan',
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
