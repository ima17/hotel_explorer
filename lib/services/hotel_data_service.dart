import 'dart:convert';
import 'package:hotel_explorer/configs/api_url.dart';
import 'package:http/http.dart' as http;

import '../models/hotel_data.dart';


class HotelService {
  static Future<List<Hotel>> fetchHotels() async {
    final response = await http.get(Uri.parse(kUrl));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      return jsonResponse.map((item) => Hotel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load hotels');
    }
  }
}
