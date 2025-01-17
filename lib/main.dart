import 'package:flutter/material.dart';
import 'screens/home_screen.dart'; // Importa tu pantalla principal

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Cookbook',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Define el tema de la app
      ),
      home: HomeScreen(), // Configura la pantalla inicial
    );
  }
}
