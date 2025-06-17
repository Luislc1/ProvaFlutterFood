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
              leading: Image(
                image: AssetImage(hamburguer.image),
                width: 30,
                height: 30,
              ),
              title: Text(hamburguer.name),
              subtitle: Text(hamburguer.description),
              trailing: Text(
                'R\$${hamburguer.price.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 231, 24, 9),
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