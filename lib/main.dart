import 'package:calculadora_imc/pages/home_page.dart';
import 'package:flutter/material.dart';

const Color mainColor = Color(0xFF8257E6);

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: mainColor,
      ),
      iconTheme: const IconThemeData(color: mainColor),
    ),
    home: const Home(),
  ));
}
