import 'package:flutter/material.dart';
import 'package:pizza_app/utils/box.dart';
import 'package:pizza_app/utils/typography.dart';

class SelectedButton extends StatelessWidget {
  final String label;
  final double width;
  final double height;
  final Function() onPressed;

  const SelectedButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.width = 98.0,
    this.height = 38.0,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
      padding: const EdgeInsets.all(0.0),
      child: Ink(
        decoration: BoxDecoration(
          gradient: boxGradientRed(),
          borderRadius: BorderRadius.circular(30.0)
        ),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [boxShadowRed()],
          ),
          constraints: BoxConstraints(maxWidth: width, minHeight: height),
          alignment: Alignment.center,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: textBodyBold(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
