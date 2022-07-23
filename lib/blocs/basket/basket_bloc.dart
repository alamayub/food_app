import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/blocs/basket/basket_event.dart';
import 'package:food_app/blocs/basket/basket_state.dart';
import 'package:food_app/blocs/voucher/voucher_bloc.dart';
import 'package:food_app/models/basket_model.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  // ignore: unused_field
  final VoucherBloc _voucherBloc;
  // ignore: unused_field
  StreamSubscription? _voucherSubscription;
  BasketBloc({required VoucherBloc voucherBloc})
      : _voucherBloc = voucherBloc,
        super(BasketLoading()) {
    // start basket loading
    on<StartBasket>((event, emit) async {
      emit(BasketLoading());
      try {
        await Future<void>.delayed(const Duration(seconds: 1));
        emit(const BasketLoaded(basket: Basket()));
      } catch (_) {}
    });
    // add new item to cart
    on<AddItem>((event, emit) async {
      final state = this.state;
      if (state is BasketLoaded) {
        try {
          emit(BasketLoaded(
            basket: state.basket.copyWith(
              items: List.from(state.basket.items)..add(event.item),
            ),
          ));
        } catch (_) {}
      }
    });
    // remove item from basket
    on<RemoveItem>((event, emit) async {
      final state = this.state;
      if (state is BasketLoaded) {
        try {
          emit(BasketLoaded(
            basket: state.basket.copyWith(
              items: List.from(state.basket.items)..remove(event.item),
            ),
          ));
        } catch (_) {}
      }
    });
    // remove all items from basket
    on<RemoveAllItem>((event, emit) async {
      final state = this.state;
      if (state is BasketLoaded) {
        try {
          emit(BasketLoaded(
            basket: state.basket.copyWith(
              items: List.from(state.basket.items)
                ..removeWhere((item) => item == event.item),
            ),
          ));
        } catch (_) {}
      }
    });
    // add voucher to the basket
    on<ApplyVoucher>((event, emit) async {
      final state = this.state;
      if (state is BasketLoaded) {
        try {
          emit(BasketLoaded(
            basket: state.basket.copyWith(voucher: event.voucher),
          ));
        } catch (_) {}
      }
    });
    // select delibvery time
    on<SelectDeliveryTime>((event, emit) async {
      final state = this.state;
      if (state is BasketLoaded) {
        try {
          emit(BasketLoaded(
            basket: state.basket.copyWith(deliveryTime: event.deliveryTime),
          ));
        } catch (_) {}
      }
    });

    // listen change for voucher bloc
    _voucherSubscription = voucherBloc.stream.listen((state) {
      if (state is VoucherSelected) {
        add(ApplyVoucher(voucher: state.voucher));
      }
    });
  }

  // @override
  // Future<void> close() async {
  //   _voucherSubscription?.cancel();
  //   super.close();
  // }
}
