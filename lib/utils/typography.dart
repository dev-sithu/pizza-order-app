import 'package:flutter/material.dart';

TextStyle textHeader1({Color? color}) {
  return const TextStyle(
    fontSize: 25.0,
    fontWeight: FontWeight.normal,
    letterSpacing: -0.3,
  ).copyWith(color: color);
}

TextStyle textHeader2({Color? color}) {
  return const TextStyle(
    fontSize: 25.0,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.3,
  ).copyWith(color: color);
}

TextStyle textHeader3({Color? color}) {
  return const TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.normal,
    letterSpacing: -0.3,
  ).copyWith(color: color);
}

TextStyle textHeader4({Color? color}) {
  return const TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.3,
  ).copyWith(color: color);
}

TextStyle textPreTitle({Color? color}) {
  return const TextStyle(
    fontSize: 10.0,
    fontWeight: FontWeight.bold,
    letterSpacing: 1,
  ).copyWith(color: color);
}

TextStyle textButtonDefault({Color? color}) {
  return const TextStyle(
    fontSize: 15.0,
    fontWeight: FontWeight.normal,
    letterSpacing: -0.3,
  ).copyWith(color: color);
}

TextStyle textButtonSelected({Color? color}) {
  return const TextStyle(
    fontSize: 15.0,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.3,
  ).copyWith(color: color);
}

TextStyle textBody({Color? color}) {
  return const TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    letterSpacing: 0,
    height: 1.5,
  ).copyWith(color: color);
}

TextStyle textBodyBold({Color? color}) {
  return const TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
    letterSpacing: 0,
    height: 1.5,
  ).copyWith(color: color);
}
