import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_backend/models/models.dart';

class CategoryListTile extends StatelessWidget {
  const CategoryListTile({
    Key? key,
    required this.category,
    required this.onTap,
  }) : super(key: key);

  final Category category;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Image.asset(
        category.imageUrl,
        height: 25,
      ),
      title: Text(
        category.name,
        style: Theme.of(context).textTheme.headline5,
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Text(
          category.description,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}
