import 'package:flutter/material.dart';
import 'Design/design_screen.dart';
import 'images/images_screen.dart';
import 'forms/forms_screen.dart';
import 'list/list_screen.dart';
import 'navigation/navigation_screen.dart';

class HomeScreen extends StatelessWidget {
  final exercises = [
    {'title': 'Diseño', 'icon': Icons.design_services, 'screen': MyApp()},
    {'title': 'Imágenes y carga', 'icon': Icons.image, 'screen': Images()},
    {'title': 'Formularios', 'icon': Icons.edit, 'screen': Formss()},
    {'title': 'Lista', 'icon': Icons.list, 'screen': ListApp()},
    {'title': 'Navegación', 'icon': Icons.navigation, 'screen': Nav()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Cookbook',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueGrey, Colors.greenAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: exercises.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => exercises[index]['screen'] as Widget,
                  ),
                );
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue.withOpacity(0.3),
                      Colors.green.withOpacity(0.3),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.6),
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(4, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      exercises[index]['icon'] as IconData,
                      color: Colors.white,
                      size: 50,
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: Text(
                        exercises[index]['title'] as String,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
