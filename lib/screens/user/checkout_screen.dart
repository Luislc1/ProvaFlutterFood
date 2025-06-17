import 'package:flutter/material.dart';
import '../../models/hamburguer.dart';
import '../../models/additional.dart';

class CheckoutScreen extends StatelessWidget {
  final Hamburguer hamburguer;
  final List<Additional> additionals;
  final int quantity;

  const CheckoutScreen({
    super.key,
    required this.hamburguer,
    required this.additionals,
    required this.quantity,
  });

  double get total {
    double total = hamburguer.price * quantity;
    for (var additional in additionals) {
      total += additional.price * quantity;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Finalizar Pedido')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Resumo do Pedido',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Image.asset('assets/images/xburger.png', height: 50, width: 50),
            Text(
              '${quantity}x ${hamburguer.name}',
              style: const TextStyle(fontSize: 16),
            ),
            if (additionals.isNotEmpty) ...[
              const SizedBox(height: 8),
              const Text('Adicionais:', style: TextStyle(fontWeight: FontWeight.bold)),
              ...additionals.map<Widget>((additional) => Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text('${quantity}x ${additional.name}'),
              )),
            ],
            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'R\$${total.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 231, 24, 9),
                  ),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 231, 24, 9),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Pedido finalizado com sucesso!', style: TextStyle(color: Colors.green),)),
                  );
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: const Text(
                  'Finalizar Pedido',
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