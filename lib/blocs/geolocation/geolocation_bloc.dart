import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/blocs/geolocation/geolocation_event.dart';
import 'package:food_app/blocs/geolocation/geolocation_state.dart';
import 'package:food_app/repositories/geolocator/geolocation_repository.dart';
import 'package:geolocator/geolocator.dart';

class GeolocationBloc extends Bloc<GeolocationEvent, GeolocationState> {
  final GeolocationRepository _geolocationRepository;
  StreamSubscription? _geolocationSubscription;
  GeolocationBloc({required GeolocationRepository geolocationRepository})
      : _geolocationRepository = geolocationRepository,
        super(GeolocationLoading());

  @override
  Stream<GeolocationState> mapEventToState(GeolocationEvent event) async* {
    if (event is LoadGeolocation) {
      yield* _mapLoadGeolocatioToState();
    } else if (event is UpdateGeolocation) {
      yield* _mapUpdateGeolocatioToState(event);
    }
  }

  Stream<GeolocationState> _mapLoadGeolocatioToState() async* {
    _geolocationSubscription?.cancel();
    final Position position = await _geolocationRepository.getCurrentLocation();
    add(UpdateGeolocation(position: position));
  }

  Stream<GeolocationState> _mapUpdateGeolocatioToState(
      UpdateGeolocation event) async* {
    yield GeolocationLoaded(position: event.position);
  }

  // close geolocation subcription
  @override
  Future<void> close() {
    _geolocationSubscription?.cancel();
    return super.close();
  }
}
