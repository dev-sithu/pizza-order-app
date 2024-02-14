import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
              text: const TextSpan(
                text: 'Delivery To:',
                style: TextStyle(fontSize: 16),
                children: <TextSpan>[
                  TextSpan(
                    text: '\nHOME',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                    ),
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
      ),
    );
  }
}
