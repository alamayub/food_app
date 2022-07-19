import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/blocs/autocomplete/autocomplete_bloc.dart';
import 'package:food_app/blocs/autocomplete/autocomplete_event.dart';
import 'package:food_app/blocs/basket/basket_bloc.dart';
import 'package:food_app/blocs/basket/basket_event.dart';
import 'package:food_app/blocs/filters/filter_bloc.dart';
import 'package:food_app/blocs/filters/filter_state.dart';
import 'package:food_app/blocs/geolocation/geolocation_bloc.dart';
import 'package:food_app/blocs/geolocation/geolocation_event.dart';
import 'package:food_app/blocs/place/place_bloc.dart';
import 'package:food_app/config/theme.dart';
import 'package:food_app/repositories/geolocator/geolocation_repository.dart';
import 'package:food_app/repositories/places/places_repository.dart';
import 'package:food_app/screens/home_screen.dart';
import 'dart:developer' as console show log;

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    console.log(event.toString());
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    console.log(transition.toString());
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    console.log(error.toString());
  }
}

void main() async {
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<GeolocationRepository>(
          create: (_) => GeolocationRepository(),
        ),
        RepositoryProvider<PlacesRepository>(
          create: (_) => PlacesRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => GeolocationBloc(
              geolocationRepository: context.read<GeolocationRepository>(),
            )..add(LoadGeolocation()),
          ),
          BlocProvider(
            create: (context) => AutocompleteBloc(
              placesRepository: context.read<PlacesRepository>(),
            )..add(const LoadAutocomplete()),
          ),
          BlocProvider(
            create: (context) => PlaceBloc(
              placesRepository: context.read<PlacesRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => FilterBloc()..add(FilterLoad()),
          ),
          BlocProvider(
            create: (context) => BasketBloc()..add(StartBasket()),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: theme(),
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
