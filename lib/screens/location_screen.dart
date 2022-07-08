import 'package:flutter/material.dart';
import 'package:food_app/widgets/gmap.dart';
import 'package:food_app/widgets/location_search_box.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key}) : super(key: key);

  static const String routeName = '/';
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const LocationScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: const Gmap(lat: 10, lng: 10),
          ),
          const Positioned(
            top: 50,
            right: 16,
            left: 16,
            child: LocationSearchBox(),
          ),
          Positioned(
            bottom: 20,
            right: 16,
            left: 16,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Save'),
            ),
          ),
        ],
      ),
    );
  }
}
