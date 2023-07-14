import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hotel_explorer/constants/styles_constants.dart';
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
          CachedNetworkImage(
            fit: BoxFit.cover,
            height: 300,
            imageUrl: hotel.image['large'] ?? '',
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ), 
            errorWidget: (context, url, error) => Image.asset(
              "assets/images/placeholder.jpg",
              fit: BoxFit.cover,
              height: 300,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              hotel.title,
              style: kHeaderTextStyle,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              hotel.description,
              style: kSubtitleTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
