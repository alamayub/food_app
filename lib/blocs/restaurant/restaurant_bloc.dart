import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/blocs/restaurant/restaurant_event.dart';
import 'package:food_app/blocs/restaurant/restaurant_state.dart';
import 'package:food_app/repositories/restaurant/restaurant_repository.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  final RestaurantRepository _restaurantRepository;
  StreamSubscription? _restaurantSubcription;
  RestaurantBloc({required RestaurantRepository restaurantRepository})
      : _restaurantRepository = restaurantRepository,
        super(RestaurantLoading()) {
    on<LoadRestaurants>((event, emit) {
      _restaurantSubcription?.cancel();
      _restaurantSubcription =
          _restaurantRepository.getRestaurants().listen((event) {
        add(UpdateRestaurants(restaurants: event));
      });
    });

    on<UpdateRestaurants>((event, emit) {
      emit(RestaurantLoaded(restaurants: event.restaurants));
    });
  }

  @override
  Future<void> close() async {
    _restaurantSubcription?.cancel();
    super.close();
  }
}
