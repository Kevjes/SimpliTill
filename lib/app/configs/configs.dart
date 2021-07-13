import 'package:flutter/material.dart';

class Config {
  static final assets = _Asset();
  static final colors = _Color();
}

class _Asset {
  final String icon = "assets/icons/icon.PNG";
  final String profil = "assets/images/images.jpg";
}

class _Color {
  final Color greyTextColor = Color(0xFF626365);
  final Color greyTextColor2 = Color(0xFF949596);
  final Color red = Color(0xFFD63649);
  final Color blue = Color(0xFF0052CC);
  final Color background = Color(0xFFF4F6FC);
  final Color appBarColor = Color(0xFF2E384D);
}
