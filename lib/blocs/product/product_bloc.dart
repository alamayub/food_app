import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/blocs/product/product_event.dart';
import 'package:food_app/blocs/product/product_state.dart';
import 'package:food_app/repositories/product/product_repository.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;
  StreamSubscription? _productSubcription;
  ProductBloc({required ProductRepository productRepository})
      : _productRepository = productRepository,
        super(ProductLoading()) {
    on<LoadProducts>((event, emit) {
      _productSubcription?.cancel();
      _productSubcription = _productRepository.getProducts().listen((event) {
        add(UpdateProducts(products: event));
      });
    });

    on<UpdateProducts>((event, emit) {
      emit(ProductLoaded(products: event.products));
    });
  }

  @override
  Future<void> close() async {
    _productSubcription?.cancel();
    super.close();
  }
}
