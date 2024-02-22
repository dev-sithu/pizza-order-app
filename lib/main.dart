import 'package:flutter/material.dart';
import 'package:pizza_app/config/routes.dart';
import 'package:pizza_app/providers/cart_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Roboto',
          scaffoldBackgroundColor: const Color(0xffF4F3F9),
        ),
        initialRoute: '/',
        routes: routes,
      ),
    );
  }
}
