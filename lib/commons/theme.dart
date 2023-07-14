import 'package:flutter/material.dart';

import '../configs/palette.dart';

final appTheme = ThemeData(
  primaryColor: Palette.kprimaryColor,
  colorScheme: ColorScheme.fromSeed(seedColor: Palette.kprimaryColor),
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    foregroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.white),
    color: Palette.kprimaryColor,
  ),
  useMaterial3: true,
);
