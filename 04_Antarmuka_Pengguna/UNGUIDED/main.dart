import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Recommendations',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WisataRecommendations(),
    );
  }
}

class WisataRecommendations extends StatelessWidget {
  const WisataRecommendations({super.key});

  @override
  Widget build(BuildContext context) {
    // List of wisata recommendations
    final List<Map<String, String>> wisataList = [
      {
        'name': 'Pantai Kuta',
        'description': 'Pantai terkenal di Bali dengan pasir putih dan ombak yang indah.',
        'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHK78kpDYuAUvMTBS_RabR7pXDR1uOkemtZA&s', // Replace with real image URLs
      },
      {
        'name': 'Pantai Kelingking',
        'description': 'Salah satu pantai cantik yang berada di pulau Nusa Penida.',
        'image': 'https://akcdn.detik.net.id/community/media/visual/2023/01/31/pantai-kelingking-foto-freepik-tawatchai07.jpeg?w=620&q=90',
      },
      {
        'name': 'Pantai Pink',
        'description': '. Pantai Pink berlokasi di Sekaroh, Kecamatan Jerowaru, Kabupaten Lombok Timur, NTB.',
        'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYI1w-ApVOcedb_Q0r5CWjRdDyizNF-6SfoA&s',
      },
      {
        'name': 'Raja Ampat',
        'description': 'Kepulauan indah di Papua, surga bagi penyelam dan pecinta alam bawah laut.',
        'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzWwRncgAfduX81a3GBrnLA4jtTpBhBfhA5Q&s',
      },
      {
        'name': 'Pantai Menganti',
        'description': 'Pantai Menganti terletak di Desa Karangduwur, Kecamatan Ayah, Kabupaten Kebumen.',
        'image': 'https://i0.wp.com/www.anekajateng.com/wp-content/uploads/2024/10/Pantai-Menganti.jpg?fit=960%2C641&ssl=1',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rekomendasi Wisata'),
      ),
      body: ListView.builder(
        itemCount: wisataList.length,
        itemBuilder: (context, index) {
          final wisata = wisataList[index];
          return Card(
            margin: const EdgeInsets.all(10),
            elevation: 5,
            child: ListTile(
              leading: Image.network(
                wisata['image']!,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(
                wisata['name']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(wisata['description']!),
            ),
          );
        },
      ),
    );
  }
}
