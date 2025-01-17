import 'package:flutter/material.dart';

void main() => runApp(const Nav());

class Nav extends StatelessWidget {
  const Nav({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigation Example',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const NavigationScreen(),
      routes: routes, // Agregamos las rutas nombradas
    );
  }
}

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8, // Ocho pestañas: una por cada ejercicio
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Navigation Example'),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Animate Widget'),
              Tab(text: 'Navigate Back'),
              Tab(text: 'Named Routes'),
              Tab(text: 'Pass Arguments'),
              Tab(text: 'Android Links'),
              Tab(text: 'iOS Links'),
              Tab(text: 'Return Data'),
              Tab(text: 'Send Data'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            AnimateWidgetScreen(),
            NavigateBackScreen(),
            NamedRoutesScreen(),
            PassArgumentsScreen(),
            AndroidLinksScreen(),
            IOSLinksScreen(),
            ReturnDataScreen(),
            SendDataScreen(),
          ],
        ),
      ),
    );
  }
}

// Pantalla 1: Animar un widget entre pantallas
class AnimateWidgetScreen extends StatelessWidget {
  const AnimateWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => const SecondScreen(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                const begin = Offset(0.0, 1.0);
                const end = Offset.zero;
                const curve = Curves.ease;

                final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
            ),
          );
        },
        child: const Text('Go to Second Screen'),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Screen')),
      body: const Center(child: Text('This is the second screen.')),
    );
  }
}

// Pantalla 2: Navegar a una nueva pantalla y regresar
class NavigateBackScreen extends StatelessWidget {
  const NavigateBackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const BackScreen(),
            ),
          );
        },
        child: const Text('Navigate and Back'),
      ),
    );
  }
}

class BackScreen extends StatelessWidget {
  const BackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Back Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Go Back'),
        ),
      ),
    );
  }
}

// Pantalla 3: Rutas con nombre
class NamedRoutesScreen extends StatelessWidget {
  const NamedRoutesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/details');
        },
        child: const Text('Go to Details Screen'),
      ),
    );
  }
}

// Configura las rutas nombradas
final Map<String, WidgetBuilder> routes = {
  '/details': (context) => const DetailsScreen(),
  '/passArguments': (context) => const ArgumentScreen(),
};

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details Screen')),
      body: const Center(child: Text('This is the details screen.')),
    );
  }
}

// Pantalla 4: Pasar argumentos a una ruta nombrada
class PassArgumentsScreen extends StatelessWidget {
  const PassArgumentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/passArguments',
            arguments: 'Hello from PassArgumentsScreen!',
          );
        },
        child: const Text('Pass Arguments'),
      ),
    );
  }
}

class ArgumentScreen extends StatelessWidget {
  const ArgumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: const Text('Argument Screen')),
      body: Center(child: Text(args)),
    );
  }
}

// Pantalla 5: Configurar enlaces para Android
class AndroidLinksScreen extends StatelessWidget {
  const AndroidLinksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Android Links Configuration'),
    );
  }
}

// Pantalla 6: Configurar enlaces universales para iOS
class IOSLinksScreen extends StatelessWidget {
  const IOSLinksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('iOS Links Configuration'),
    );
  }
}

// Pantalla 7: Retornar datos de una pantalla
class ReturnDataScreen extends StatelessWidget {
  const ReturnDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const GetDataScreen(),
            ),
          );

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Returned: $result')),
          );
        },
        child: const Text('Return Data'),
      ),
    );
  }
}

class GetDataScreen extends StatelessWidget {
  const GetDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Get Data Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context, 'This is the returned data!'),
          child: const Text('Return This Data'),
        ),
      ),
    );
  }
}

// Pantalla 8: Enviar datos a una nueva pantalla
class SendDataScreen extends StatelessWidget {
  const SendDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DataScreen(data: 'Hello, new screen!'),
            ),
          );
        },
        child: const Text('Send Data'),
      ),
    );
  }
}

class DataScreen extends StatelessWidget {
  final String data;

  const DataScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Data Screen')),
      body: Center(child: Text(data)),
    );
  }
}
