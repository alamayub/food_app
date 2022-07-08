import 'package:flutter/material.dart';
import 'package:food_app/screens/basket_screen.dart';
import 'package:food_app/screens/checkout_screen.dart';
import 'package:food_app/screens/delivery_time_screen.dart';
import 'package:food_app/screens/filter_screen.dart';
import 'package:food_app/screens/home_screen.dart';
import 'package:food_app/screens/location_screen.dart';
import 'package:food_app/screens/restairant_details_screen.dart';
import 'package:food_app/screens/restaurant_list_screen.dart';
import 'package:food_app/screens/voucher_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case '/location':
        return LocationScreen.route();
      case '/basket':
        return BasketScreen.route();
      case '/checkout':
        return CheckoutScreen.route();
      case '/delivery-time':
        return DeliveryTimeScreen.route();
      case '/filter':
        return FilterScreen.route();
      case '/restaurant-details':
        return RestaurantDetailsScreen.route();
      case '/restaurant-list':
        return RestaurantListScreen.route();
      case '/voucher':
        return VoucherScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(appBar: AppBar(title: const Text('Error'))),
      settings: const RouteSettings(name: '/location'),
    );
  }
}
