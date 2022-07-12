import 'package:flutter/material.dart';
import 'package:food_app/models/category_model.dart';

class CategoryBox extends StatelessWidget {
  final Category category;
  const CategoryBox({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(category.image),
          ),
          const SizedBox(height: 6),
          Text(category.name, style: Theme.of(context).textTheme.headline5!)
        ],
      ),
    );
  }
}
