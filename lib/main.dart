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
      debugShowCheckedModeBanner: false,
      title: 'Hamburgueria',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(255, 231, 24, 9),
          secondary: Colors.amber,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 231, 24, 9),
          foregroundColor: Colors.white,
        ),
      ),
      home: const LoginScreen(),
    );
  }
}