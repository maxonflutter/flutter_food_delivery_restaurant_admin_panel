import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_backend/models/models.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
              product.imageUrl,
            ),
          ),
          Text(
            product.name,
            style: Theme.of(context).textTheme.headline5,
          ),
          Text(
            '\$${product.price}',
            style: Theme.of(context).textTheme.headline6,
          ),
        ],
      ),
    );
  }
}
