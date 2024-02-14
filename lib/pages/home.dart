import 'package:flutter/material.dart';
import 'package:pizza_app/utils/font_style.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                TextSpan(
                  text: '\nHOME',
                  style: textPreTitle(),
                ),
              ]
            ),
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
      ),
      body: const Center(
        child: Text('Hello World!'),
      ),
    );
  }
}
