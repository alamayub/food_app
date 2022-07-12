import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/blocs/filters/filter_event.dart';
import 'package:food_app/blocs/filters/filter_state.dart';
import 'package:food_app/models/category_filter_model.dart';
import 'package:food_app/models/filter_model.dart';
import 'package:food_app/models/price_filter_model.dart';
import 'dart:core';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(FilterLoading());

  @override
  Stream<FilterState> mapEventToState(FilterEvent event) async* {
    if (event is FilterLoad) {
      yield* _mapFilterToLoadState();
    }
    if (event is CategoryFilterUpdated) {
      yield* _mapCategoryFilterUpdatedToState(event, state);
    }
    if (event is PriceFilterUpdated) {
      yield* _mapPriceFilterUpdatedToState(event, state);
    }
  }

  Stream<FilterState> _mapFilterToLoadState() async* {
    yield FilterLoaded(
      filter: Filter(
        categoryFilter: CategoryFilter.filters,
        priceFilter: PriceFilter.filters,
      ),
    );
  }

  Stream<FilterState> _mapCategoryFilterUpdatedToState(
    CategoryFilterUpdated event,
    FilterState state,
  ) async* {
    if (state is FilterLoaded) {
      final List<CategoryFilter> updatedCategoryFilter =
          state.filter.categoryFilter.map((x) {
        return x.id == event.categoryFilter.id ? event.categoryFilter : x;
      }).toList();

      yield FilterLoaded(
        filter: Filter(
          categoryFilter: updatedCategoryFilter,
          priceFilter: state.filter.priceFilter,
        ),
      );
    }
  }

  Stream<FilterState> _mapPriceFilterUpdatedToState(
    PriceFilterUpdated event,
    FilterState state,
  ) async* {
    if (state is FilterLoaded) {
      final List<PriceFilter> updatedPriceFilter =
          state.filter.priceFilter.map((x) {
        return x.id == event.priceFilter.id ? event.priceFilter : x;
      }).toList();

      yield FilterLoaded(
        filter: Filter(
          categoryFilter: state.filter.categoryFilter,
          priceFilter: updatedPriceFilter,
        ),
      );
    }
  }
}
