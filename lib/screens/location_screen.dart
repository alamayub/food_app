import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/blocs/autocomplete/autocomplete_bloc.dart';
import 'package:food_app/blocs/autocomplete/autocomplete_state.dart';
import 'package:food_app/blocs/geolocation/geolocation_bloc.dart';
import 'package:food_app/blocs/geolocation/geolocation_state.dart';
import 'package:food_app/widgets/gmap.dart';
import 'package:food_app/widgets/location_search_box.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key}) : super(key: key);

  static const String routeName = '/location';
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
            child: BlocBuilder<GeolocationBloc, GeolocationState>(
              builder: (context, state) {
                if (state is GeolocationLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is GeolocationLoaded) {
                  return Gmap(
                    lat: state.position.latitude,
                    lng: state.position.longitude,
                  );
                } else {
                  return const Text('Something went wrong...');
                }
              },
            ),
          ),
          Positioned(
            top: 50,
            right: 16,
            left: 16,
            child: Column(
              children: [
                const LocationSearchBox(),
                BlocBuilder<AutocompleteBloc, AutocompleteState>(
                  builder: (context, state) {
                    if (state is AutocompleteLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is AutocompleteLoaded) {
                      return state.autocomplete.isNotEmpty
                          ? Container(
                              margin: const EdgeInsets.only(top: 8.0),
                              height: 300,
                              color: Colors.black.withOpacity(0.6),
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: state.autocomplete.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(
                                      state.autocomplete[index].description,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6!
                                          .copyWith(color: Colors.white),
                                    ),
                                  );
                                },
                              ),
                            )
                          : Container();
                    } else {
                      return const Text('Something went wrong...');
                    }
                  },
                )
              ],
            ),
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
