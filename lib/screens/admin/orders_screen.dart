import 'package:flutter/material.dart';
import 'package:app/models/order.dart';
import 'package:app/models/hamburguer.dart';
import 'package:app/models/additional.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final List<Order> _orders = [
    Order(
      hamburguer: Hamburguer(
        id: '1',
        name: 'X-Burguer',
        description: 'Pão, hambúrguer, queijo, alface e tomate',
        price: 15.90,
        image: '',
      ),
      additionals: [
        Additional(id: '1', name: 'Bacon', price: 3.50),
      ],
      quantity: 2,
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
      quantity: 1,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedidos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: (){

            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _orders.length,
        itemBuilder: (context, index) => _buildOrderCard(_orders[index]),
      ),
    );
  }

  Widget _buildOrderCard(Order order) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              order.hamburguer.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text('Quantidade: ${order.quantity}'),
            if (order.additionals.isNotEmpty) ...[
              const SizedBox(height: 8),
              const Text('Adicionais:'),
              ...order.additionals.map((a) => Text('- ${a.name} (R\$${a.price})')),
            ],
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total: R\$${order.total.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Chip(
                  label: const Text(
                    'Preparando',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.orange,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}