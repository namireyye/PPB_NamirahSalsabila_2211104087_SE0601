import 'package:flutter/material.dart';
import 'package:praktikum_07/detail.dart';
import 'package:praktikum_07/product.dart';

class MyPage extends StatelessWidget {
  MyPage({super.key});

  final List<Product> products = [
    Product(
        id: 1,
        nama: 'Mouse',
        harga: 230000.00,
        imageUrl:
            'https://resource.logitechg.com/w_386,ar_1.0,c_limit,f_auto,q_auto,dpr_2.0/d_transparent.gif/content/dam/gaming/en/products/g502x-plus/gallery/g502x-plus-gallery-1-black.png?v=1',
        deskripsi: 'Barang pertama'),
    Product(
        id: 2,
        nama: 'Keyboard',
        harga: 500000.00,
        imageUrl:
            'https://resource.logitech.com/w_1600,c_limit,q_auto,f_auto,dpr_1.0/d_transparent.gif/content/dam/logitech/en/products/keyboards/mx-mechanical/gallery/mx-mechanical-keyboard-top-view-graphite-us.png?v=1&quot',
        deskripsi: 'Barang kedua'),
    Product(
        id: 3,
        nama: 'Headphone',
        harga: 7500000.00,
        imageUrl:
            'https://m.media-amazon.com/images/I/61CGHv6kmWL.AC_UF894,1000_QL80.jpg',
        deskripsi: 'Barang ketiga'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Class Model'),
        centerTitle: true,
        backgroundColor: Colors.blue[300],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final Product = products[index];
          return ListTile(
            leading: Image.network(
              Product.imageUrl,
              width: 70,
              height: 70,
            ),
            title: Text(Product.nama),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Harga : ${Product.harga}'),
                Text(Product.deskripsi),
              ],
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const detailProduct(
                      data: Center(
                        child: Column(
                          children: [
                            Text('Ini data dari MyPage'),
                            Text('Text tambahan'),
                          ],
                        ),
                      ),
                    ),
                  ));
            },
          );
        },
      ),
    );
  }
}