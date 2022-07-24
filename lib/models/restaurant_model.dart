import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Restaurant extends Equatable {
  final String? id;
  final String name;
  final String type;
  final double minimumOrder;
  final double deliveryTime;
  final List<dynamic> categories;
  final bool isNew;
  final bool featured;
  final String mobile;
  final String email;
  final String street;
  final String city;
  final double latitude;
  final double longitude;
  final String ownerName;
  final String ownerMobile;
  final String ownerEmail;
  final String description;
  final String image;
  final List<dynamic> likes;
  final double rating;

  const Restaurant({
    this.id,
    required this.name,
    required this.type,
    required this.minimumOrder,
    required this.deliveryTime,
    required this.categories,
    required this.isNew,
    required this.featured,
    required this.mobile,
    required this.email,
    required this.street,
    required this.city,
    required this.latitude,
    required this.longitude,
    required this.ownerName,
    required this.ownerEmail,
    required this.ownerMobile,
    required this.description,
    required this.image,
    required this.likes,
    required this.rating,
  });

  Restaurant copyWith({
    String? id,
    String? name,
    String? type,
    double? minimumOrder,
    double? deliveryTime,
    List<dynamic>? categories,
    bool? isNew,
    bool? featured,
    String? mobile,
    String? email,
    String? street,
    String? city,
    double? latitude,
    double? longitude,
    String? ownerName,
    String? ownerMobile,
    String? ownerEmail,
    String? description,
    String? image,
    List<dynamic>? likes,
    double? rating,
  }) {
    return Restaurant(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      minimumOrder: minimumOrder ?? this.minimumOrder,
      deliveryTime: deliveryTime ?? this.deliveryTime,
      categories: categories ?? this.categories,
      isNew: isNew ?? this.isNew,
      featured: featured ?? this.featured,
      mobile: mobile ?? this.mobile,
      email: email ?? this.email,
      street: street ?? this.street,
      city: city ?? this.city,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      ownerEmail: ownerEmail ?? this.ownerEmail,
      ownerMobile: ownerMobile ?? this.ownerMobile,
      ownerName: ownerName ?? this.ownerName,
      description: description ?? this.description,
      image: image ?? this.image,
      likes: likes ?? this.likes,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'minimumOrder': minimumOrder,
      'deliveryTime': deliveryTime,
      'categories': categories,
      'isNew': isNew,
      'featured': featured,
      'mobile': mobile,
      'email': email,
      'street': street,
      'city': city,
      'latitude': latitude,
      'longitude': longitude,
      'ownerEmail': ownerEmail,
      'ownerMobile': ownerMobile,
      'ownerName': ownerName,
      'description': description,
      'image': image,
      'likes': likes,
      'rating': rating,
    };
  }

  factory Restaurant.fromSnapshot(DocumentSnapshot snap) {
    return Restaurant(
      id: snap.id,
      name: snap['basicInfo']['name'] ?? '',
      type: snap['basicInfo']['type'] ?? '',
      minimumOrder: snap['basicInfo']['minimumOrder'].toDouble() ?? 0,
      deliveryTime: snap['basicInfo']['deliveryTime'].toDouble() ?? 0,
      categories: snap['basicInfo']['categories'] ?? [],
      isNew: snap['basicInfo']['isNew'] ?? false,
      featured: snap['basicInfo']['featured'] ?? false,
      mobile: snap['address']['mobile'] ?? '',
      email: snap['address']['email'] ?? '',
      street: snap['address']['street'] ?? '',
      city: snap['address']['city'] ?? '',
      latitude: snap['address']['latitude'].toDouble() ?? 0,
      longitude: snap['address']['longitude'] ?? 0,
      ownerEmail: snap['owner']['email'] ?? '',
      ownerMobile: snap['owner']['mobile'] ?? '',
      ownerName: snap['owner']['name'] ?? '',
      description: '',
      image: snap['image'],
      likes: snap['likes'] ?? [],
      rating: snap['rating'].toDouble() ?? 0,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        type,
        minimumOrder,
        deliveryTime,
        categories,
        isNew,
        featured,
        mobile,
        email,
        street,
        city,
        latitude,
        longitude,
        ownerName,
        ownerMobile,
        ownerEmail,
        description,
        image,
        likes,
        rating,
      ];
}
