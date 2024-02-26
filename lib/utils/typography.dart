import 'package:flutter/material.dart';

Color defaultTextColor = const Color(0xff6D6E9C);
Color redTextColor = const Color(0xffF5313F);

TextStyle textHeader1({Color? color}) {
  return const TextStyle(
    fontSize: 25.0,
    fontWeight: FontWeight.w300,
    letterSpacing: -0.3,
  ).copyWith(color: color);
}

TextStyle textHeader2({Color? color}) {
  return const TextStyle(
    fontSize: 25.0,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.3,
  ).copyWith(color: color);
}

TextStyle textHeader3({Color? color}) {
  return const TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w300,
    letterSpacing: -0.3,
  ).copyWith(color: color);
}

TextStyle textHeader4({Color? color}) {
  return const TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.3,
  ).copyWith(color: color);
}

TextStyle textPreTitle({Color? color}) {
  return const TextStyle(
    fontSize: 10.0,
    fontWeight: FontWeight.w700,
    letterSpacing: 1,
  ).copyWith(color: color);
}

TextStyle textButtonDefault({Color? color}) {
  return TextStyle(
    fontSize: 15.0,
    fontWeight: FontWeight.w300,
    letterSpacing: -0.3,
    color: defaultTextColor
  ).copyWith(color: color);
}

TextStyle textButtonSelected({Color? color}) {
  return const TextStyle(
    fontSize: 15.0,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.3,
    color: Colors.white,
  ).copyWith(color: color);
}

TextStyle textBody({Color? color}) {
  return TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w300,
    letterSpacing: 0,
    height: 1.5,
    color: defaultTextColor
  ).copyWith(color: color);
}

TextStyle textBodyBold({Color? color}) {
  return TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    height: 1.5,
    color: defaultTextColor
  ).copyWith(color: color);
}

TextStyle textTitleLight({Color? color}) {
  return const TextStyle(
    fontSize: 15.0,
    fontWeight: FontWeight.w300,
    letterSpacing: -0.3,
  ).copyWith(color: color);
}
