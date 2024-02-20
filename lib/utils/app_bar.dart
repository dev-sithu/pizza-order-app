import 'package:flutter/material.dart';
import 'package:pizza_app/utils/typography.dart';

AppBar appBarMain(BuildContext context) {
  return AppBar(
    backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
    centerTitle: true,
    leading: GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: const Icon(Icons.arrow_back, color: Color(0xff6D6E9C)),
    ),
    title: Text(
      'Uncle John Pizzas',
      style: textTitleLight(color: const Color(0xff6D6E9C))
    ),
    actions: [
      IconButton(
        icon: const Icon(Icons.home, color: Color(0xff6D6E9C)),
        onPressed: () {
          Navigator.of(context).popUntil(ModalRoute.withName('/'));
        },
      ),
      const SizedBox(width: 20)
    ],
  );
}

AppBar appBarHome(BuildContext context) {
  return AppBar(
    backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
    leading: GestureDetector(
      onTap: () => {
        debugPrint('Leading icon clicked!')
      },
      child: const Icon(Icons.menu),
    ),
    title: GestureDetector(
      onTap: () => {
        debugPrint('Title clicked!')
      },
      child: RichText(
      text: TextSpan(
        text: 'Delivery To:',
        style: textBody(),
        children: <TextSpan>[
          TextSpan(text: '\nHOME', style: textPreTitle()),
        ]),
      ),
    ),
    actions: [
      IconButton(
        icon: const Icon(Icons.shopping_bag),
        onPressed: () {
          debugPrint('Action icon clicked');
        },
      ),
      const SizedBox(width: 20)
    ],
  );
}
