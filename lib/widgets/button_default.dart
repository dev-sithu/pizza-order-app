import 'package:flutter/material.dart';
import 'package:pizza_app/utils/typography.dart';

class DefaultButton extends StatelessWidget {
  final String label;
  final double width;
  final double height;
  final Function() onPressed;

  const DefaultButton({
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
          borderRadius: BorderRadius.circular(30.0)
        ),
        child: Container(
          constraints: BoxConstraints(maxWidth: width, minHeight: height),
          alignment: Alignment.center,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: textButtonDefault(),
          ),
        ),
      ),
    );
  }
}
