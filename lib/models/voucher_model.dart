import 'package:equatable/equatable.dart';

class Voucher extends Equatable {
  final int id;
  final String code;
  final double value;

  const Voucher({
    required this.id,
    required this.code,
    required this.value,
  });

  @override
  List<Object?> get props => [id, code, value];

  static List<Voucher> couchers = const [
    Voucher(id: 1, code: 'SAVE5', value: 5.0),
    Voucher(id: 2, code: 'PROMO10', value: 9.99),
    Voucher(id: 3, code: 'HOLI15', value: 15.0)
  ];
}
