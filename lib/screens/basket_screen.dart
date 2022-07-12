import 'package:flutter/material.dart';
import 'package:food_app/screens/checkout_screen.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({Key? key}) : super(key: key);

  static const String routeName = '/basket';
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const BasketScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Basket Screen'),
      ),
      bottomNavigationBar: BottomAppBar(
        child: MaterialButton(
          height: 50,
          color: Theme.of(context).primaryColor,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const CheckoutScreen()));
          },
          child: const Text('Go To Checkout'),
        ),
      ),
    );
  }
}
