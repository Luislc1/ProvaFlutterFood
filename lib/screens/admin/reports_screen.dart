import 'package:flutter/material.dart';
import 'package:app/models/order.dart';
import 'package:app/models/hamburguer.dart'; // Importação adicionada

class ReportsScreen extends StatelessWidget {
  final List<Order> orders = [
    Order(
      hamburguer: Hamburguer(
        id: '1',
        name: 'X-Burguer',
        description: 'Pão, hambúrguer, queijo, alface e tomate',
        price: 15.90,
        image: '',
      ),
      additionals: [],
      quantity: 5,
    ),
    Order(
      hamburguer: Hamburguer(
        id: '2',
        name: 'X-Bacon',
        description: 'Pão, hambúrguer, queijo, bacon',
        price: 18.90,
        image: '',
      ),
      additionals: [],
      quantity: 3,
    ),
  ];

  ReportsScreen({super.key});

  double get totalSales {
    return orders.fold(0, (sum, order) => sum + order.total);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Relatórios'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Resumo de Vendas',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text(
                      'Total de Vendas',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'R\$${totalSales.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text('Pedidos por Item'),
                    const SizedBox(height: 10),
                    ..._buildSalesByItem(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildSalesByItem() {
    final itemCounts = <String, int>{};
    
    for (var order in orders) {
      itemCounts.update(
        order.hamburguer.name,
        (value) => value + order.quantity,
        ifAbsent: () => order.quantity,
      );
    }

    return itemCounts.entries.map((entry) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(entry.key),
          Text('${entry.value} vendas'),
        ],
      ),
    )).toList();
  }
}