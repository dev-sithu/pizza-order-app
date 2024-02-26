  import 'package:flutter/material.dart';

LinearGradient boxGradientRed() {
  return const LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Color(0xffFFA360),
      Color(0xffF5313F),
    ],
  );
}

BoxShadow boxShadowRed() {
  // box-shadow: 0px 6px 25px 0px #F5313F66;
  return const BoxShadow(
    offset: Offset(0, 6),
    blurRadius: 25,
    spreadRadius: 0,
    color: Color.fromRGBO(245, 49, 63, 0.4),
  );
}
