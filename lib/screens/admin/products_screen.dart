import 'package:flutter/material.dart';
import 'package:app/models/hamburguer.dart';
import 'package:app/widgets/hamburguer_card.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final List<Hamburguer> _hamburguers = [
    Hamburguer(
      id: '1',
      name: 'X-Burguer',
      description: 'Pão, hambúrguer, queijo, alface e tomate',
      price: 15.90,
      image: '',
    ),
    Hamburguer(
      id: '2',
      name: 'X-Bacon',
      description: 'Pão, hambúrguer, queijo, bacon',
      price: 18.90,
      image: '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cardápio'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: (){},
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _hamburguers.length,
        itemBuilder: (context, index) => HamburguerCard(
          hamburguer: _hamburguers[index],
        ),
      ),
    );
  }

}