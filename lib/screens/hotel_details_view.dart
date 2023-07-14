import 'package:flutter/material.dart';
import 'package:hotel_explorer/widgets/map_view.dart';

import '../models/hotel_data.dart';

class HotelDetailView extends StatelessWidget {
  final Hotel hotel;

  const HotelDetailView({Key? key, required this.hotel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(hotel.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.location_on),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HotelMapView(hotel: hotel),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Image.network(
          "https://cdn.pixabay.com/photo/2021/12/11/07/59/hotel-6862159_1280.jpg",
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 8.0), 
        Text(
          hotel.title,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 4.0), 
        Text(
          hotel.description,
          style: const TextStyle(
            fontSize: 12.0,
            color: Colors.grey,
          ),
        ),
      ],
    ),
    );
  }
}


