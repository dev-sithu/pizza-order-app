import 'package:flutter/material.dart';
import 'package:pizza_app/config/constants.dart';

class CartProvider extends ChangeNotifier {
  String _size = '';
  String _crust = '';
  List<Topping> _toppings = [];
  double price = 0.00;
  double _total = 0.00;

  // Getters
  String get size => _size;
  String get crust => _crust;
  List<Topping> get toppings => _toppings;

  double get total {
    _total = prices[size]! + crusts[crust]!;
    for (var val in _toppings) {
      _total += ingredients[val]['price'];
     }

    return _total;
  }

  // Setters
  set size(String value) {
    _size = value;
    price = prices[value]!;

    notifyListeners();
  }

  set crust(String value) {
    _crust = value;
    price = prices[size]! + crusts[value]!;

    notifyListeners();
  }

  set toppings(List<Topping> value) {
    _toppings = value;
    notifyListeners();
  }

  setDefaultSize() {
    if (size.isEmpty) {
      _size = 'md'; // set the private property directly to not notify listeners
      price = prices[_size]!;
    }
  }

  setDefaultCrust() {
    setDefaultSize();

    if (crust.isEmpty) {
      _crust = 'thin'; // set the private property directly to not notify listeners
      price = prices[_size]! + crusts[_crust]!;
    }
  }
}
