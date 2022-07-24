import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String? id;
  final String restaurantId;
  final String name;
  final String category;
  final String description;
  final String image;
  final double price;
  final String commisionType;
  final double commision;
  final bool featured;
  final bool newProduct;
  final double rating;

  const Product({
    this.id,
    required this.restaurantId,
    required this.name,
    required this.category,
    required this.description,
    required this.image,
    required this.price,
    required this.commisionType,
    required this.commision,
    required this.featured,
    required this.newProduct,
    required this.rating,
  });

  Product copyWith({
    String? id,
    String? restaurantId,
    String? name,
    String? category,
    String? description,
    String? image,
    double? price,
    String? commisionType,
    double? commision,
    bool? featured,
    bool? newProduct,
    double? rating,
  }) {
    return Product(
      id: id ?? this.id,
      restaurantId: restaurantId ?? this.restaurantId,
      name: name ?? this.name,
      category: category ?? this.category,
      description: description ?? this.description,
      image: image ?? this.image,
      price: price ?? this.price,
      commisionType: commisionType ?? this.commisionType,
      commision: commision ?? this.commision,
      featured: featured ?? this.featured,
      newProduct: newProduct ?? this.newProduct,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'id': id,
      'restaurantId': restaurantId,
      'name': name,
      'category': category,
      'description': description,
      'image': image,
      'price': price,
      'commisionType': commisionType,
      'commision': commision,
      'featured': featured,
      'newProduct': newProduct,
      'rating': rating,
    };
  }

  factory Product.fromSnapshot(DocumentSnapshot snap) {
    return Product(
      id: snap.id,
      restaurantId: snap['restaurantId'],
      name: snap['name'],
      category: snap['category'],
      description: snap['description'] ?? '',
      image: snap['image'],
      price: snap['price'].toDouble(),
      commisionType: snap['commisionType'],
      commision: snap['commision'].toDouble(),
      featured: snap['featured'],
      newProduct: snap['newProduct'],
      rating: snap['rating'].toDouble(),
    );
  }

  @override
  List<Object?> get props => [
        id,
        restaurantId,
        name,
        category,
        description,
        image,
        price,
        featured,
        newProduct,
        rating,
      ];
}
