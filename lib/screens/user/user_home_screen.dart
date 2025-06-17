import 'package:flutter/material.dart';
import '../../screens/login_screen.dart';
import 'menu_screen.dart';
import 'order_screen.dart';
import 'checkout_screen.dart';
import '../../models/hamburguer.dart';
import '../../models/additional.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  final Hamburguer _demoHamburguer = Hamburguer(
    id: '1',
    name: 'X-Burguer',
    description: 'Pão, hambúrguer, queijo, alface e tomate',
    price: 15.90,
    image: 'assets/xburguer.jpg',
  );
  
  final List<Additional> _demoAdditionals = [];
  int _demoQuantity = 1;

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      const MenuScreen(),
      OrderScreen(hamburguer: _demoHamburguer),
      CheckoutScreen(
        hamburguer: _demoHamburguer,
        additionals: _demoAdditionals,
        quantity: _demoQuantity,
      ),
    ];
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hamburgueria'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            ),
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          });
        },
        selectedItemColor: Color.fromARGB(255, 231, 24, 9),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Cardápio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Meu Pedido',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment),
            label: 'Pagamento',
          ),
        ],
      ),
    );
  }
}