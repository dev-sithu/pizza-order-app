import 'package:flutter/material.dart';
import 'package:pizza_app/pages/choose_crust.dart';
import 'package:pizza_app/pages/choose_size.dart';
import 'package:pizza_app/pages/choose_toppings.dart';
import 'package:pizza_app/pages/home.dart';

Map<String, Widget Function(dynamic context)> routes = {
  '/': (context) => const Home(),
  '/size': (context) => const ChooseSize(),
  '/crust': (context) => const ChooseCrust(),
  '/toppings': (context) => const ChooseToppings(),
};