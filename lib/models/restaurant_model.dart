import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Restaurant extends Equatable {
  final String? id;
  final String name;
  final List<dynamic> categories;
  final String description;
  final String image;

  const Restaurant({
    this.id,
    required this.name,
    required this.categories,
    required this.description,
    required this.image,
  });

  Restaurant copyWith({
    String? id,
    String? name,
    List<String>? categories,
    String? description,
    String? image,
  }) {
    return Restaurant(
      id: id ?? this.id,
      name: name ?? this.name,
      categories: categories ?? this.categories,
      description: description ?? this.description,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'id': id,
      'name': name,
      'categories': categories,
      'description': description,
      'image': image,
    };
  }

  factory Restaurant.fromSnapshot(DocumentSnapshot snap) {
    return Restaurant(
      id: snap.id,
      name: snap['name'],
      categories: snap['categories'],
      description: snap['description'],
      image: snap['image'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        categories,
        description,
        image,
      ];
}
