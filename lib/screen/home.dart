import 'package:flutter/material.dart';
import '../models/shirt_item.dart';
import '../data/mock_data.dart';
import 'insert.dart';
import 'detail.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ShirtItem> shirts = List.from(mockShirts);

  void _addNewShirt(ShirtItem newShirt) {
    setState(() {
      shirts.add(newShirt);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerRight,
          child: Text(
            'CET STORE 184',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.orange[200],
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView.builder(
        itemCount: shirts.length,
        itemBuilder: (context, index) {
          final shirt = shirts[index];
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              leading: Image.asset(
                'assets/shirts/${shirt.imageName}',
                width: 60,
                fit: BoxFit.cover,
              ),
              title: Text('${shirt.brand} - ${shirt.type.name}'),
              subtitle: Text(
                'Size: ${shirt.size.name.toUpperCase()}, Chest: ${shirt.chestSize}"\n'
                'Price: \$${shirt.price.toStringAsFixed(2)} - ${shirt.storeName}',
              ),
              trailing: Image.asset(
                'assets/logos/${shirt.logo}',
                width: 40,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailPage(shirt: shirt),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () async {
          final newShirt = await Navigator.push<ShirtItem>(
            context,
            MaterialPageRoute(builder: (_) => const InsertPage()),
          );
          if (newShirt != null) {
            _addNewShirt(newShirt);
          }
        },
        child: const Icon(Icons.add),
      ),
      backgroundColor: Colors.white,
    );
  }
}
