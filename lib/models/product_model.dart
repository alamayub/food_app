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
  final String commissionType;
  final double commission;
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
    required this.commissionType,
    required this.commission,
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
    String? commissionType,
    double? commission,
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
      commissionType: commissionType ?? this.commissionType,
      commission: commission ?? this.commission,
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
      'commissionType': commissionType,
      'commission': commission,
      'featured': featured,
      'newProduct': newProduct,
      'rating': rating,
    };
  }

  factory Product.fromSnapshot(DocumentSnapshot snap) {
    return Product(
      id: snap.id,
      restaurantId: snap['restaurantId'],
      name: snap['name'] ?? '',
      category: snap['category'] ?? '',
      description: '',
      image: snap['image'],
      price: snap['price'].toDouble(),
      commissionType: snap['commissionType'],
      commission: snap['commission'].toDouble() ?? 0,
      featured: snap['featured'] ?? false,
      newProduct: snap['newProduct'] ?? false,
      rating: snap['rating'].toDouble() ?? 0,
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
