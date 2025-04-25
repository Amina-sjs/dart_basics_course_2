import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const CatFactsApp());
}

class CatFactsApp extends StatelessWidget {
  const CatFactsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat Facts',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.orange,
      ),
      home: const HomeScreen(),
    );
  }
}
