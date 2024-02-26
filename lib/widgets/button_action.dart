import 'package:flutter/material.dart';
import 'package:pizza_app/utils/box.dart';
import 'package:pizza_app/utils/typography.dart';

class ActionButton extends StatelessWidget {
  final String label;
  final Function() onPressed;

  const ActionButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 59.0,
      child: FloatingActionButton(
        onPressed: onPressed,
        shape: const ContinuousRectangleBorder(),
        child: Container(
          decoration: BoxDecoration(
            gradient: boxGradientRed(),
          ),
          width: double.infinity,
          alignment: Alignment.center,
          height: 59.0,
          child: Text(
            label,
            style: textButtonSelected(),
            textAlign: TextAlign.center
          )
        )
      ),
    );
  }
}
