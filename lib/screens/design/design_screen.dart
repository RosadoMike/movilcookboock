import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Importa google_fonts para fuentes desde el paquete

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tabbed Navigation Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        textTheme: GoogleFonts.robotoTextTheme().copyWith(
          bodyLarge: const TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
          titleLarge: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal, // Color para los botones
            textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      home: const TabbedHomeScreen(),
    );
  }
}

class TabbedHomeScreen extends StatelessWidget {
  const TabbedHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7, // Ahora hay 7 pestañas
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tabbed Navigation Example'),
          centerTitle: true,
          bottom: TabBar(
            isScrollable: true, // Hace el TabBar desplazable si hay muchas pestañas
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(30), // Bordes redondeados
              color: Colors.tealAccent, // Fondo para la pestaña seleccionada
            ),
            labelColor: Colors.black, // Color del texto de la pestaña seleccionada
            unselectedLabelColor: Colors.white, // Color del texto de las pestañas no seleccionadas
            tabs: const [
              Tab(text: 'SnackBar Example'),
              Tab(text: 'Drawer Example'),
              Tab(text: 'Font Example'),
              Tab(text: 'Orientation Example'),
              Tab(text: 'Custom Font'),
              Tab(text: 'Theme Example'),
              Tab(text: 'Tabs Example'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            SnackBarExample(),
            DrawerExample(),
            FontExample(),
            OrientationExample(),
            CustomFontExample(),
            ThemeExample(),
            TabsExample(),
          ],
        ),
      ),
    );
  }
}

// Nueva pestaña: Tabs Example
class TabsExample extends StatelessWidget {
  const TabsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Número de pestañas dentro de esta pantalla
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tabs Example'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_bus)),
              Tab(icon: Icon(Icons.directions_bike)),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Icon(Icons.directions_car),
            Icon(Icons.directions_bus),
            Icon(Icons.directions_bike)
          ],
        ),
      ),
    );
  }
}

// Contenido de las subpestañas en "Tabs Example"
class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Bienvenido a la pestaña Home',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}

class BusinessTab extends StatelessWidget {
  const BusinessTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Esta es la pestaña Business',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}

class SchoolTab extends StatelessWidget {
  const SchoolTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Aquí está la pestaña School',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}

// Nueva pestaña: Theme Example
class ThemeExample extends StatelessWidget {
  const ThemeExample({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Example'),
        backgroundColor: theme.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Texto con estilo "bodyLarge" del theme.',
              style: theme.textTheme.bodyLarge,
            ),
            const SizedBox(height: 10),
            Text(
              'Texto con estilo "titleLarge" del theme.',
              style: theme.textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Botón con estilo global'),
            ),
          ],
        ),
      ),
    );
  }
}

// SnackBar Example (el primer ejemplo)
class SnackBarExample extends StatelessWidget {
  const SnackBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            final snackBar = SnackBar(
              content: const Text('Esto es un SnackBar'),
              action: SnackBarAction(
                label: 'Deshacer',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Acción deshecha')),
                  );
                },
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          child: const Text('Mostrar SnackBar'),
        ),
      ),
    );
  }
}

// Drawer Example (el segundo ejemplo)
class DrawerExample extends StatefulWidget {
  const DrawerExample({super.key});

  @override
  State<DrawerExample> createState() => _DrawerExampleState();
}

class _DrawerExampleState extends State<DrawerExample> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer Example'),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Home'),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Business'),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('School'),
              selected: _selectedIndex == 2,
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Font Example (el ejemplo con google_fonts)
class FontExample extends StatelessWidget {
  const FontExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Font Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Este texto usa la fuente Lato.',
              style: GoogleFonts.lato(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Este texto usa la fuente Roboto.',
              style: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Este texto usa la fuente Pacifico.',
              style: GoogleFonts.pacifico(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

// Orientation Example (nuevo ejemplo para actualizar la UI según la orientación)
class OrientationExample extends StatelessWidget {
  const OrientationExample({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List.generate(20, (index) => 'Item $index');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Orientation Example'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          final crossAxisCount = orientation == Orientation.portrait ? 2 : 3;

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: items.length,
            padding: const EdgeInsets.all(8.0),
            itemBuilder: (context, index) {
              return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  items[index],
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// Custom Font Example (nuevo ejemplo para la fuente RobotoCondensed)
class CustomFontExample extends StatelessWidget {
  const CustomFontExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Custom Font Example',
          style: TextStyle(fontFamily: 'RobotoCondensed', fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Este texto usa RobotoCondensed-Regular.',
              style: TextStyle(fontFamily: 'RobotoCondensed', fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Este texto usa RobotoCondensed-Bold.',
              style: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

