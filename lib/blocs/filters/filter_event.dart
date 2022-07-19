import 'package:equatable/equatable.dart';
import 'package:food_app/models/category_filter_model.dart';
import 'package:food_app/models/price_filter_model.dart';

abstract class FilterEvent extends Equatable {
  const FilterEvent();

  @override
  List<Object?> get props => [];
}

class LoadFilter extends FilterEvent {
  @override
  List<Object?> get props => [];
}

class UpdateCategoryFilter extends FilterEvent {
  final CategoryFilter categoryFilter;
  const UpdateCategoryFilter({required this.categoryFilter });

  @override
  List<Object?> get props => [categoryFilter];
}

class UpdatePriceFilter extends FilterEvent {
  final PriceFilter priceFilter;
  const UpdatePriceFilter({required this.priceFilter });

  @override
  List<Object?> get props => [priceFilter];
}
