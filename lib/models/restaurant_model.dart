import 'package:equatable/equatable.dart';
import 'package:food_app/models/menu_item_model.dart';

class Restaurant extends Equatable {
  final int id;
  final String image;
  final String name;
  final List<String> tags;
  final List<MenuItem> menuItems;
  final int deliveryTime;
  final double deliveryFee;
  final double distance;

  const Restaurant({
    required this.id,
    required this.image,
    required this.name,
    required this.tags,
    required this.menuItems,
    required this.deliveryTime,
    required this.deliveryFee,
    required this.distance,
  });

  @override
  List<Object?> get props => [
        id,
        image,
        name,
        tags,
        deliveryTime,
        deliveryFee,
        distance,
      ];

  static List<Restaurant> restaurants = [
    Restaurant(
      id: 1,
      image:
          'https://media.istockphoto.com/photos/two-empty-wine-glasses-sitting-in-a-restaurant-on-a-warm-sunny-picture-id1018141890?k=20&m=1018141890&s=612x612&w=0&h=uMDP00MMIhlwQE77EEcoelc2oSKBT_B6avaXqtxgiow=',
      name: 'Burj Palace Restaurant',
      tags: const ['Italian', 'Indian', 'Pizza'],
      menuItems: MenuItem.menuItems.where((e) => e.id == 1).toList(),
      deliveryTime: 30,
      deliveryFee: 25.2,
      distance: 5.9,
    ),
    Restaurant(
      id: 2,
      image:
          'https://media-cdn.tripadvisor.com/media/photo-s/1a/b8/46/6d/london-stock.jpg',
      name: 'BuffeBite Restaurant',
      tags: const ['Thali', 'Indian', 'Biryani', 'Kabab'],
      menuItems: MenuItem.menuItems.where((e) => e.id == 2).toList(),
      deliveryTime: 30,
      deliveryFee: 25.2,
      distance: 5.9,
    ),
    Restaurant(
      id: 3,
      image:
          'https://cdn.vox-cdn.com/thumbor/5d_RtADj8ncnVqh-afV3mU-XQv0=/0x0:1600x1067/1200x900/filters:focal(672x406:928x662)/cdn.vox-cdn.com/uploads/chorus_image/image/57698831/51951042270_78ea1e8590_h.7.jpg',
      name: 'Macroni Restaurant',
      tags: const ['Chinese', 'Thai', 'Biryani'],
      menuItems: MenuItem.menuItems.where((e) => e.id == 3).toList(),
      deliveryTime: 30,
      deliveryFee: 25.2,
      distance: 5.9,
    ),
    Restaurant(
      id: 4,
      image:
          'https://imageio.forbes.com/specials-images/imageserve/628e3814b2b4253c117d4f13/Dining-Column-on-New-Heights-Restaurant/960x0.jpg?format=jpg&width=960',
      name: 'Mike Perry Restaurant',
      tags: const ['Mushroom', 'Indian', 'Biryani', 'Kabab'],
      menuItems: MenuItem.menuItems.where((e) => e.id == 4).toList(),
      deliveryTime: 30,
      deliveryFee: 25.2,
      distance: 5.9,
    )
  ];
}
