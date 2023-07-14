import 'package:flutter/material.dart';
import 'package:hotel_explorer/constants/styles_constants.dart';

import '../models/hotel_data.dart';
import '../services/hotel_data_service.dart';
import 'hotel_details_view.dart';

class HotelListView extends StatefulWidget {
  const HotelListView({Key? key}) : super(key: key);

  @override
  HotelListViewState createState() => HotelListViewState();
}

class HotelListViewState extends State<HotelListView> {
  late Future<List<Hotel>> futureHotels;

  @override
  void initState() {
    super.initState();
    futureHotels = HotelService.fetchHotels();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hotel List'),
      ),
      body: FutureBuilder<List<Hotel>>(
        future: futureHotels,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(snapshot.data![index].image['small']!),
                      ),
                      title: Text(
                        snapshot.data![index].title,
                        style: kHeaderTextStyle,
                      ),
                      subtitle: Text(
                        snapshot.data![index].address,
                        style: kSubtitleTextStyle,
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                HotelDetailView(hotel: snapshot.data![index]),
                          ),
                        );
                      },
                    ),
                    const Divider(),
                  ],
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
