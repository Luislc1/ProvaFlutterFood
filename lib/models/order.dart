import '../models/hamburguer.dart';
import '../models/additional.dart';

class Order {
  final Hamburguer hamburguer;
  final List<Additional> additionals;
  final int quantity;

  Order({
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
}