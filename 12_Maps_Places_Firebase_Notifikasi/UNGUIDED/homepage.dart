import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:place_picker_google/place_picker_google.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static final LatLng _kMapCenter = const LatLng(-6.9733165, 107.6281415);
  static final CameraPosition _kInitialPosition =
      CameraPosition(target: _kMapCenter, zoom: 14.0, tilt: 0, bearing: 0);

  String? selectedPlaceName; // Untuk menyimpan nama lokasi
  List<dynamic>? nearbyPlaces; // Untuk menyimpan daftar tempat terdekat

  final String apiKey = "AIzaSyAUYRND6xGwbPx-hJfbdZiFtblqh2G5zpA";

  // Fungsi untuk mendapatkan nama lokasi berdasarkan koordinat
  Future<String> getPlaceName(double lat, double lng) async {
    final url =
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$apiKey";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data["results"] != null && data["results"].isNotEmpty) {
        return data["results"][0]["formatted_address"] ?? "Unnamed Location";
      } else {
        return "Unnamed Location";
      }
    } else {
      throw Exception("Failed to fetch place name");
    }
  }

  // Fungsi untuk mendapatkan nearby places berdasarkan koordinat
  Future<Map<String, dynamic>> fetchNearbyPlaces(double lat, double lng) async {
    final url =
        "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$lat,$lng&radius=500&key=$apiKey";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to fetch nearby places");
    }
  }

  // Fungsi untuk menampilkan Place Picker
  void showPlacePicker() async {
    LocationResult? result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PlacePicker(
          apiKey: apiKey,
          initialLocation: _kMapCenter,
        ),
      ),
    );

    if (result != null) {
      final lat = result.latLng?.latitude ?? 0.0;
      final lng = result.latLng?.longitude ?? 0.0;

      try {
        final placeName = await getPlaceName(lat, lng);
        final places = await fetchNearbyPlaces(lat, lng);

        setState(() {
          selectedPlaceName = placeName;
          nearbyPlaces = places['results'];
        });
      } catch (e) {
        print("Error: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Maps Demo'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              initialCameraPosition: _kInitialPosition,
              myLocationEnabled: true,
              onTap: (LatLng position) async {
                try {
                  final placeName =
                      await getPlaceName(position.latitude, position.longitude);
                  final places = await fetchNearbyPlaces(
                      position.latitude, position.longitude);

                  setState(() {
                    selectedPlaceName = placeName;
                    nearbyPlaces = places['results'];
                  });
                } catch (e) {
                  print("Error: $e");
                }
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  selectedPlaceName ?? "No location selected",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                if (nearbyPlaces != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Nearby Places:",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      ...nearbyPlaces!.map((place) {
                        return Text(
                          place['name'] ?? "Unknown",
                          style: const TextStyle(fontSize: 14),
                        );
                      }).toList(),
                    ],
                  )
                else
                  const Text("No nearby places found"),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showPlacePicker,
        child: const Icon(Icons.place),
        backgroundColor: Colors.amber,
      ),
    );
  }
}