import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/models/voucher_model.dart';
import 'package:food_app/repositories/voucher/voucher_repository.dart';

part 'voucher_event.dart';
part 'voucher_state.dart';

class VoucherBloc extends Bloc<VoucherEvent, VoucherState> {
  final VoucherRepository _voucherRepository;
  StreamSubscription? _voucherSubcription;
  VoucherBloc({required VoucherRepository voucherRepository})
      : _voucherRepository = voucherRepository,
        super(VoucherLoading()) {
    on<LoadVouchers>((event, emit) {
      _voucherSubcription?.cancel();
      _voucherSubcription = _voucherRepository.getVouchers().listen((event) {
        add(UpdateVouchers(vouchers: event));
      });
    });

    on<UpdateVouchers>((event, emit) {
      emit(VoucherLoaded(vouchers: event.vouchers));
    });
    on<SelectVouchers>((event, emit) {
      emit(VoucherSelected(voucher: event.voucher));
    });
  }
}
