import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Voucher extends Equatable {
  final String id;
  final String code;
  final double value;

  const Voucher({
    required this.id,
    required this.code,
    required this.value,
  });

  Voucher copyWith({
    String? id,
    String? code,
    double? value,
  }) {
    return Voucher(
      id: id ?? this.id,
      code: code ?? this.code,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'code': code,
      'value': value,
    };
  }

  factory Voucher.fromSnapshot(DocumentSnapshot snapshot) {
    return Voucher(
      id: snapshot.id,
      code: snapshot['code'],
      value: snapshot['value'].toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, code, value];
}
