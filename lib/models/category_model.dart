import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String? id;
  final String name;
  final String image;

  const Category({
    this.id,
    required this.name,
    required this.image,
  });

  Category copyWith({
    String? id,
    String? name,
    String? image,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }

  factory Category.fromSnapshot(DocumentSnapshot snap) {
    return Category(
      id: snap.id,
      name: snap['name'],
      image: snap['image'],
    );
  }

  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, name, image];

  static List<Category> categories = const [];
}
