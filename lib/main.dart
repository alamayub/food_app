import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/blocs/autocomplete/autocomplete_bloc.dart';
import 'package:food_app/blocs/autocomplete/autocomplete_event.dart';
import 'package:food_app/blocs/basket/basket_bloc.dart';
import 'package:food_app/blocs/basket/basket_event.dart';
import 'package:food_app/blocs/filters/filter_bloc.dart';
import 'package:food_app/blocs/filters/filter_event.dart';
import 'package:food_app/blocs/geolocation/geolocation_bloc.dart';
import 'package:food_app/blocs/geolocation/geolocation_event.dart';
import 'package:food_app/blocs/place/place_bloc.dart';
import 'package:food_app/blocs/voucher/voucher_bloc.dart';
import 'package:food_app/config/simple_bloc_observer.dart';
import 'package:food_app/config/theme.dart';
import 'package:food_app/firebase_options.dart';
import 'package:food_app/repositories/geolocator/geolocation_repository.dart';
import 'package:food_app/repositories/places/places_repository.dart';
import 'package:food_app/repositories/voucher/voucher_repository.dart';
import 'package:food_app/screens/toeato.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: SimpleBlocObserver(),
  );
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
            create: (context) => FilterBloc()..add(LoadFilter()),
          ),
          BlocProvider(
            create: (context) =>
                VoucherBloc(voucherRepository: VoucherRepository())
                  ..add(LoadVouchers()),
          ),
          BlocProvider(
            create: (context) => BasketBloc(
              voucherBloc: BlocProvider.of<VoucherBloc>(context),
            )..add(StartBasket()),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: theme(),
          home: const Toeato(),
        ),
      ),
    );
  }
}
