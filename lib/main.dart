import 'package:flutter/material.dart';
import 'package:shoes_app/pages/home.dart';
import 'package:shoes_app/pages/shoes_detail.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/home': (context) => Home(),
      '/shoes': (context) => ShoesDetail(),
    },
  ));
}