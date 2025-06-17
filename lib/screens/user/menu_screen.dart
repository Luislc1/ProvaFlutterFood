import 'package:flutter/material.dart';
import '../../models/hamburguer.dart';
import '../../mock_data/hamburguers.dart';
import 'order_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: mockHamburguers.length,
        itemBuilder: (context, index) {
          final hamburguer = mockHamburguers[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.orange[100],
                child: const Icon(Icons.fastfood, color: Colors.deepOrange),
              ),
              title: Text(hamburguer.name),
              subtitle: Text(hamburguer.description),
              trailing: Text(
                'R\$${hamburguer.price.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderScreen(hamburguer: hamburguer),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}