import 'package:flutter/material.dart';
import 'package:pizza_app/pages/choose_crust.dart';
import 'package:pizza_app/pages/choose_size.dart';
import 'package:pizza_app/pages/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color(0xffF4F3F9),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/size': (context) => const ChooseSize(),
        '/crust': (context) => const ChooseCrust(),
      },
    );
  }
}
