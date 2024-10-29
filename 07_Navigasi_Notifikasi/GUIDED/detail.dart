import 'package:flutter/material.dart';

class detailProduct extends StatelessWidget {
  const detailProduct({super.key, required this.data});

  final Widget data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Produk'),
        centerTitle: true,
        backgroundColor: Colors.blue[300],
      ),
      body: data, 
      // const Center(
      //   child: Text(data),
      // ),
    );
  }
}