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
      case LocationScreen.routeName:
        return LocationScreen.route();
      case BasketScreen.routeName:
        return BasketScreen.route();
      case CheckoutScreen.routeName:
        return CheckoutScreen.route();
      case DeliveryTimeScreen.routeName:
        return DeliveryTimeScreen.route();
      case FilterScreen.routeName:
        return FilterScreen.route();
      case RestaurantDetailsScreen.routeName:
        return RestaurantDetailsScreen.route();
      case RestaurantListScreen.routeName:
        return RestaurantListScreen.route();
      case VoucherScreen.routeName:
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
