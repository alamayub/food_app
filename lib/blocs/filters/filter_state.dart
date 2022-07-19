import 'package:equatable/equatable.dart';
import 'package:food_app/models/filter_model.dart';

abstract class FilterState extends Equatable {
  const FilterState();

  @override
  List<Object> get props => [];
}

class FilterLoading extends FilterState {}

class FilterLoaded extends FilterState {
  final Filter filter;
  const FilterLoaded({
    required this.filter,
  });

  @override
  List<Object> get props => [filter];
}
