import 'package:flutter/material.dart';
import 'package:pizza_app/utils/semicircle_downward.dart';

class ArcDownward extends StatelessWidget {
  final double diameter;

  const ArcDownward({super.key, this.diameter = 200});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: SemicircleDownward(),
      size: Size(diameter, diameter),
    );
  }
}
