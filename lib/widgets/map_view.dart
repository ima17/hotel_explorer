import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/hotel_data.dart';

class HotelMapView extends StatefulWidget {
  final Hotel hotel;

  const HotelMapView({Key? key, required this.hotel}) : super(key: key);

  @override
  HotelMapViewState createState() => HotelMapViewState();
}

class HotelMapViewState extends State<HotelMapView> {
  late GoogleMapController _mapController;
  bool _isLoading = true;

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: LatLng(
                double.parse(widget.hotel.latitude),
                double.parse(widget.hotel.longitude),
              ),
              zoom: 2,
            ),
            markers: {
              Marker(
                markerId: MarkerId(widget.hotel.id.toString()),
                position: LatLng(
                  double.parse(widget.hotel.latitude),
                  double.parse(widget.hotel.longitude),
                ),
                infoWindow: InfoWindow(
                  title: widget.hotel.title,
                  snippet: widget.hotel.address,
                ),
              ),
            },
          ),
          if (_isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
