import 'package:flutter/material.dart';
import 'package:pizza_app/pages/cart.dart';
import 'package:pizza_app/pages/checkout.dart';
import 'package:pizza_app/pages/choose_crust.dart';
import 'package:pizza_app/pages/choose_size.dart';
import 'package:pizza_app/pages/choose_toppings.dart';
import 'package:pizza_app/pages/home.dart';
import 'package:pizza_app/pages/order.dart';

Map<String, Widget Function(dynamic context)> routes = {
  '/': (context) => const Home(),
  '/size': (context) => const ChooseSize(),
  '/crust': (context) => const ChooseCrust(),
  '/toppings': (context) => const ChooseToppings(),
  '/cart': (context) => const Cart(),
  '/checkout': (context) => const Checkout(),
  '/order': (context) => const Order(),
};
