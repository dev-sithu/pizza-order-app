import 'package:flutter/material.dart';

class IconEdit extends StatelessWidget {
  const IconEdit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow( // box-shadow: 0px 6px 25px 0px #F5313F66;
            offset: Offset(0, 6),
            blurRadius: 25,
            spreadRadius: 0,
            color: Color.fromRGBO(245, 49, 63, 0.4),
          )
        ],
      ),
      child: Image.asset('assets/images/icon_edit.png')
    );
  }
}
