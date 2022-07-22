import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/models/category_model.dart';
import 'package:food_app/repositories/category/category_repository.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepository;
  StreamSubscription? _categorySubcription;
  CategoryBloc({required CategoryRepository categoryRepository})
      : _categoryRepository = categoryRepository,
        super(CategoryLoading()) {
    on<LoadCategory>((event, emit) {
      _categorySubcription?.cancel();
      _categorySubcription =
          _categoryRepository.getCategories().listen((event) {
        add(UpdateCategory(categories: event));
      });
    });

    on<UpdateCategory>((event, emit) {
      emit(CategoryLoaded(categories: event.categories));
    });
  }

  @override
  Future<void> close() async {
    _categorySubcription?.cancel();
    super.close();
  }
}
