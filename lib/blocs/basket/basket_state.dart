import 'package:equatable/equatable.dart';
import 'package:food_app/models/basket_model.dart';

abstract class BasketState extends Equatable {
  const BasketState();
}

class BasketLoading extends BasketState {
  @override
  List<Object?> get props => [];

  get basket => null;
}

class BasketLoaded extends BasketState {
  final Basket basket;

  const BasketLoaded({required this.basket});

  @override
  List<Object?> get props => [basket];
}
