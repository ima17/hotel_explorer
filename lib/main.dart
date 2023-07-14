import 'package:flutter/material.dart';
import 'package:hotel_explorer/commons/theme.dart';

import 'screens/hotel_list_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: appTheme,
      home: const HotelListView(),
    );
  }
}
