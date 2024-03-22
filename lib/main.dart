import 'package:flutter/material.dart';
import 'package:conversor_moedas/pages/homepage.dart';

void main() async {
  runApp(
    MaterialApp(
      home: const HomePage(),
      theme: ThemeData(
        hintColor: Colors.amber,
        primaryColor: Colors.white,
      ),
    ),
  );
}
