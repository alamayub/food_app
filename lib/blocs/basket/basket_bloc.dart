import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/blocs/basket/basket_event.dart';
import 'package:food_app/blocs/basket/basket_state.dart';
import 'package:food_app/models/basket_model.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  BasketBloc() : super(BasketLoading());

  @override
  Stream<BasketState> mapEventToState(BasketEvent event) async* {
    if (event is StartBasket) {
      yield* _mapStartBasketToState();
    } else if (event is AddItem) {
      yield* _mapAddItemToState(event, state);
    } else if (event is RemoveItem) {
      yield* _mapRemoveItemToState(event, state);
    } else if (event is ToggleSwitch) {
      yield* _mapToggleSwitchToState(event, state);
    }
  }

  Stream<BasketState> _mapStartBasketToState() async* {
    yield BasketLoading();
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      yield const BasketLoaded(basket: Basket());
    } catch (_) {}
  }

  Stream<BasketState> _mapAddItemToState(
    AddItem event,
    BasketState state,
  ) async* {
    if (state is BasketLoaded) {
      try {
        yield BasketLoaded(
          basket: state.basket.copyWith(
            items: List.from(state.basket.items)..add(event.item),
          ),
        );
      } catch (_) {}
    }
  }

  Stream<BasketState> _mapRemoveItemToState(
    RemoveItem event,
    BasketState state,
  ) async* {
    if (state is BasketLoaded) {
      try {
        yield BasketLoaded(
          basket: state.basket.copyWith(
            items: List.from(state.basket.items)..remove(event.item),
          ),
        );
      } catch (_) {}
    }
  }

  Stream<BasketState> _mapToggleSwitchToState(
    ToggleSwitch event,
    BasketState state,
  ) async* {
    if (state is BasketLoaded) {
      try {
        yield BasketLoaded(
          basket: state.basket.copyWith(
            cutlery: !state.basket.cutlery,
          ),
        );
      } catch (_) {}
    }
  }
}
