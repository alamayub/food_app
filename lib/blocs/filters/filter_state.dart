import 'package:equatable/equatable.dart';
import 'package:food_app/models/category_filter_model.dart';
import 'package:food_app/models/price_filter_model.dart';

abstract class FilterEvent extends Equatable {
  const FilterEvent();

  @override
  List<Object> get props => [];
}

class FilterLoad extends FilterEvent {
  @override
  List<Object> get props => [];
}

class CategoryFilterUpdated extends FilterEvent {
  final CategoryFilter categoryFilter;
  const CategoryFilterUpdated({
    required this.categoryFilter,
  });

  @override
  List<Object> get props => [categoryFilter];
}

class PriceFilterUpdated extends FilterEvent {
  final PriceFilter priceFilter;
  const PriceFilterUpdated({
    required this.priceFilter,
  });

  @override
  List<Object> get props => [priceFilter];
}
