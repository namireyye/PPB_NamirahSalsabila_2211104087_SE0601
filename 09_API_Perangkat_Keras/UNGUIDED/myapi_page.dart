import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyApiPage extends StatefulWidget {
  const MyApiPage({super.key});

  @override
  State<MyApiPage> createState() => _MyApiPageState();
}

class _MyApiPageState extends State<MyApiPage> {
  File? _selectedImage; // Untuk menyimpan gambar yang dipilih/diambil
  late CameraController _controller;
  Future<void>? _initializeControllerFuture;

  @override
  void initState() {
    _initializeCamera();
    super.initState();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    _controller = CameraController(
      firstCamera,
      ResolutionPreset.high,
    );

    _initializeControllerFuture = _controller.initialize();
    setState(() {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  Future<void> _captureImageWithCamera() async {
    try {
      await _initializeControllerFuture; // Pastikan kamera sudah diinisialisasi
      final image = await _controller.takePicture();
      setState(() {
        _selectedImage = File(image.path);
      });
    } catch (e) {
      print(e);
    }
  }

  void _clearImage() {
    setState(() {
      _selectedImage = null; // Hapus gambar
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Perangkat Keras'),
        centerTitle: true,
        backgroundColor: Colors.grey.shade400,
      ),
      body: Column(
        children: [
          Expanded(
            child: _selectedImage == null
                ? const Center(child: Text('Tidak ada gambar'))
                : Image.file(_selectedImage!), // Tampilkan gambar
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                onPressed: _pickImageFromGallery,
                icon: const Icon(Icons.photo),
                label: const Text('Gallery'),
              ),
              ElevatedButton.icon(
                onPressed: _captureImageWithCamera,
                icon: const Icon(Icons.camera_alt),
                label: const Text('Camera'),
              ),
              ElevatedButton.icon(
                onPressed: _clearImage,
                icon: const Icon(Icons.delete),
                label: const Text('Hapus Gambar'),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
