import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_backend/models/models.dart';

class ProductListTile extends StatelessWidget {
  const ProductListTile({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
          product.imageUrl,
        ),
      ),
      title: Text(
        product.name,
        style: Theme.of(context).textTheme.headline5,
      ),
      subtitle: Text(
        product.description,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
