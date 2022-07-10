import 'package:equatable/equatable.dart';
import 'package:food_app/models/place.dart';

abstract class PlaceState extends Equatable {
  const PlaceState();

  @override
  List<Object> get props => [];
}

class PlaceLoading extends PlaceState {}

class PlaceLoaded extends PlaceState {
  final Place place;
  const PlaceLoaded({required this.place});

  @override
  List<Object> get props => [place];
}

class PlaceError extends PlaceState {}
