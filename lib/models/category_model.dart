import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final int id;
  final String name;
  final String image;

  const Category({
    required this.id,
    required this.name,
    required this.image,
  });

  @override
  List<Object?> get props => [id, name, image];

  static List<Category> categories = const [
    Category(
      id: 1,
      name: 'Pizza',
      image:
          'https://static.toiimg.com/photo/msid-87930581/87930581.jpg?211826',
    ),
    Category(
      id: 2,
      name: 'Biryani',
      image:
          'https://upload.wikimedia.org/wikipedia/commons/c/cf/Biryani_of_Lahore.jpg',
    ),
    Category(
      id: 3,
      name: 'Burger',
      image:
          'https://www.chicken.ca/wp-content/uploads/2020/09/Moist-Chicken-Burgers.jpg',
    ),
    Category(
      id: 4,
      name: 'Sweets',
      image:
          'https://images.news18.com/ibnlive/uploads/2021/10/diwali-sweet-dishes.jpg',
    ),
    Category(
      id: 5,
      name: 'Thali',
      image:
          'https://i.pinimg.com/originals/e1/da/d5/e1dad5315972c8a9db86fb01d69c7ecb.jpg',
    ),
    Category(
      id: 6,
      name: 'Drinks',
      image:
          'https://www.acouplecooks.com/wp-content/uploads/2021/06/Strawberry-Water-006.jpg',
    )
  ];
}
