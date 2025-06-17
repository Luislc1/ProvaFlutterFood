import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const HamburgueriaApp());
}

class HamburgueriaApp extends StatelessWidget {
  const HamburgueriaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hamburgueria Delícia',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrange,
          secondary: Colors.amber,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepOrange,
          foregroundColor: Colors.white,
        ),
      ),
      home: const LoginScreen(),
    );
  }
}