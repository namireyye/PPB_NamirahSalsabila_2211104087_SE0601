import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiController extends GetxController {
  final String baseUrl = "https://jsonplaceholder.typicode.com";
  var posts = <dynamic>[].obs; // Observable list untuk menyimpan data
  var isLoading = false.obs; // Observable untuk status loading

  // Fungsi untuk GET data
  Future<void> fetchPosts() async {
    _setLoading(true);
    try {
      final response = await http.get(Uri.parse('$baseUrl/posts'));
      if (response.statusCode == 200) {
        posts.value = json.decode(response.body);
        _showSnackbar("Sukses", "Data berhasil diambil", Colors.green);
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      _showSnackbar("Error", e.toString(), Colors.red);
    } finally {
      _setLoading(false);
    }
  }

  // Fungsi untuk POST data
  Future<void> createPost() async {
    _setLoading(true);
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/posts'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'title': 'Flutter Post',
          'body': 'Ini contoh POST.',
          'userId': 1,
        }),
      );
      if (response.statusCode == 201) {
        posts.add({
          'title': 'Flutter Post',
          'body': 'Ini contoh POST.',
          'id': posts.length + 1,
        });
        _showSnackbar("Sukses", "Data berhasil ditambahkan", Colors.green);
      } else {
        throw Exception('Failed to create post');
      }
    } catch (e) {
      _showSnackbar("Error", e.toString(), Colors.red);
    } finally {
      _setLoading(false);
    }
  }

  // Fungsi untuk UPDATE data
  Future<void> updatePost() async {
    _setLoading(true);
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/posts/1'),
        body: json.encode({
          'title': 'Updated Title',
          'body': 'Updated Body',
          'userId': 1,
        }),
      );
      if (response.statusCode == 200) {
        final updatedPost = posts.firstWhere((post) => post['id'] == 1);
        updatedPost['title'] = 'Updated Title';
        updatedPost['body'] = 'Updated Body';
        posts.refresh();
        _showSnackbar("Sukses", "Data berhasil diperbarui", Colors.blue);
      } else {
        throw Exception('Failed to update post');
      }
    } catch (e) {
      _showSnackbar("Error", e.toString(), Colors.red);
    } finally {
      _setLoading(false);
    }
  }

  // Fungsi untuk DELETE data
  Future<void> deletePost() async {
    _setLoading(true);
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/posts/1'),
      );
      if (response.statusCode == 200) {
        posts.removeWhere((post) => post['id'] == 1);
        _showSnackbar("Sukses", "Data berhasil dihapus", Colors.red);
      } else {
        throw Exception('Failed to delete post');
      }
    } catch (e) {
      _showSnackbar("Error", e.toString(), Colors.red);
    } finally {
      _setLoading(false);
    }
  }

  // Fungsi untuk menampilkan Snackbar di atas
  void _showSnackbar(String title, String message, Color bgColor) {
    Get.snackbar(
      title,
      message,
      backgroundColor: bgColor,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP, // Posisi snackbar di bagian atas
      margin: const EdgeInsets.all(12),
      borderRadius: 8,
    );
  }

  void _setLoading(bool value) {
    isLoading.value = value;
  }
}
