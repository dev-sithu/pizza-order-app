import 'package:flutter/material.dart';
import 'package:pizza_app/utils/box.dart';

class IconEdit extends StatelessWidget {
  const IconEdit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [boxShadowRed()],
      ),
      child: Image.asset('assets/images/icon_edit.png')
    );
  }
}
