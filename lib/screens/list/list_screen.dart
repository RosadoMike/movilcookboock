import 'package:flutter/material.dart';

void main() => runApp(const ListApp());

class ListApp extends StatelessWidget {
  const ListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lists Example',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const ListsScreen(),
    );
  }
}

class ListsScreen extends StatelessWidget {
  const ListsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7, // Siete pestañas en total
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Lists Example'),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Grid List'),
              Tab(text: 'Horizontal List'),
              Tab(text: 'Different Items'),
              Tab(text: 'Simple ListView'),
              Tab(text: 'Long List'),
              Tab(text: 'Spaced Items'),
              Tab(text: 'Floating App Bar'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            GridListScreen(),
            HorizontalListScreen(),
            DifferentItemsListScreen(),
            SimpleListViewScreen(),
            LongListScreen(),
            SpacedItemsListScreen(),
            FloatingAppBarListScreen(),
          ],
        ),
      ),
    );
  }
}

// Pantalla de lista en cuadrícula
class GridListScreen extends StatelessWidget {
  const GridListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
      padding: const EdgeInsets.all(8.0),
      children: List.generate(100, (index) {
        return Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              'Item $index',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        );
      }),
    );
  }
}

// Pantalla de lista horizontal
class HorizontalListScreen extends StatelessWidget {
  const HorizontalListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(8.0),
      children: List.generate(10, (index) {
        return Container(
          width: 160,
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            color: Colors.teal[100 * (index % 9 + 1)],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              'Item $index',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        );
      }),
    );
  }
}

// Pantalla de lista con diferentes tipos de elementos
class DifferentItemsListScreen extends StatelessWidget {
  const DifferentItemsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ListItem> items = [
      HeadingItem("Category 1"),
      MessageItem("Message 1", "Subtitle 1"),
      MessageItem("Message 2", "Subtitle 2"),
      HeadingItem("Category 2"),
      MessageItem("Message 3", "Subtitle 3"),
      MessageItem("Message 4", "Subtitle 4"),
    ];

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];

        if (item is HeadingItem) {
          return ListTile(
            title: Text(
              item.heading,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          );
        } else if (item is MessageItem) {
          return ListTile(
            title: Text(item.title),
            subtitle: Text(item.subtitle),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

// Modelos para los diferentes tipos de elementos en la lista
abstract class ListItem {}

class HeadingItem implements ListItem {
  final String heading;
  HeadingItem(this.heading);
}

class MessageItem implements ListItem {
  final String title;
  final String subtitle;
  MessageItem(this.title, this.subtitle);
}

// Pantalla de ListView simple
class SimpleListViewScreen extends StatelessWidget {
  const SimpleListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(
          leading: Icon(Icons.map),
          title: Text('Map'),
        ),
        ListTile(
          leading: Icon(Icons.photo_album),
          title: Text('Album'),
        ),
        ListTile(
          leading: Icon(Icons.phone),
          title: Text('Phone'),
        ),
      ],
    );
  }
}

// Pantalla de ListView con muchos elementos
class LongListScreen extends StatelessWidget {
  const LongListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List<String>.generate(10000, (i) => "Item $i");

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(items[index]),
        );
      },
    );
  }
}

// Pantalla de lista con elementos espaciados
class SpacedItemsListScreen extends StatelessWidget {
  const SpacedItemsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(4, (index) {
        return Container(
          height: 100,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.teal[100 * (index % 9 + 1)],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              'Item $index',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        );
      }),
    );
  }
}

// Pantalla de lista con barra flotante
class FloatingAppBarListScreen extends StatelessWidget {
  const FloatingAppBarListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          expandedHeight: 200.0,
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('Floating App Bar'),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return ListTile(
                leading: const Icon(Icons.list),
                title: Text('Item #$index'),
              );
            },
            childCount: 50,
          ),
        ),
      ],
    );
  }
}
