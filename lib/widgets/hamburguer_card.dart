import 'package:flutter/material.dart';
import '../models/hamburguer.dart';

class HamburguerCard extends StatelessWidget {
  final Hamburguer hamburguer;
  final VoidCallback onTap;

  const HamburguerCard({
    super.key,
    required this.hamburguer,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
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
        onTap: onTap,
      ),
    );
  }
}