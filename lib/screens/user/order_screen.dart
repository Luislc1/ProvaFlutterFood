import 'package:flutter/material.dart';
import '../../models/hamburguer.dart';
import '../../models/additional.dart';
import '../../mock_data/additionals.dart';
import 'checkout_screen.dart';

class OrderScreen extends StatefulWidget {
  final Hamburguer hamburguer;

  const OrderScreen({super.key, required this.hamburguer});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final List<Additional> selectedAdditionals = [];
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.hamburguer.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.hamburguer.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(widget.hamburguer.description),
            const SizedBox(height: 16),
            Text(
              'R\$${widget.hamburguer.price.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 231, 24, 9),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Adicionais:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ...mockAdditionals.map((additional) => CheckboxListTile(
                  title: Text(additional.name),
                  subtitle: Text('+ R\$${additional.price.toStringAsFixed(2)}'),
                  value: selectedAdditionals.contains(additional),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value == true) {
                        selectedAdditionals.add(additional);
                      } else {
                        selectedAdditionals.remove(additional);
                      }
                    });
                  },
                )),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text('Quantidade:'),
                const SizedBox(width: 16),
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    if (quantity > 1) {
                      setState(() {
                        quantity--;
                      });
                    }
                  },
                ),
                Text(quantity.toString()),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      quantity++;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 231, 24, 9),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CheckoutScreen(
                        hamburguer: widget.hamburguer,
                        additionals: selectedAdditionals,
                        quantity: quantity,
                      ),
                    ),
                  );
                },
                child: const Text(
                  'Adicionar ao Carrinho',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
