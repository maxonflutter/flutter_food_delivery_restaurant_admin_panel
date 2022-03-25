import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_food_delivery_backend/blocs/product/product_bloc.dart';
import 'package:flutter_food_delivery_backend/models/models.dart';
import 'package:flutter_food_delivery_backend/widgets/widgets.dart';

class AddProductCard extends StatelessWidget {
  const AddProductCard({
    Key? key,
  }) : super(key: key);

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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return _buildNewProduct(context);
                },
              );
            },
            iconSize: 40,
            icon: Icon(
              Icons.add_circle,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Add a Product',
            style: Theme.of(context).textTheme.headline5,
          ),
        ],
      ),
    );
  }

  Dialog _buildNewProduct(BuildContext context) {
    Product product = const Product(
      restaurantId: 'MbyvrvKY1hdNohNU11EL',
      name: '',
      category: '',
      description: '',
      imageUrl: '',
      price: 0,
    );

    return Dialog(
      child: Container(
        height: 450,
        width: 500,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add a Product',
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(height: 20),
            CustomDropdownButton(
              items:
                  Category.categories.map((category) => category.name).toList(),
              onChanged: (value) {
                product = product.copyWith(category: value);
              },
            ),
            const SizedBox(height: 10),
            CustomTextFormField(
              maxLines: 1,
              title: 'Name',
              hasTitle: true,
              initialValue: '',
              onChanged: (value) {
                product = product.copyWith(name: value);
              },
            ),
            CustomTextFormField(
              maxLines: 1,
              title: 'Price',
              hasTitle: true,
              initialValue: '',
              onChanged: (value) {
                product = product.copyWith(price: double.parse(value));
              },
            ),
            CustomTextFormField(
              maxLines: 1,
              title: 'Image URL',
              hasTitle: true,
              initialValue: '',
              onChanged: (value) {
                product = product.copyWith(imageUrl: value);
              },
            ),
            CustomTextFormField(
              maxLines: 3,
              title: 'Description',
              hasTitle: true,
              initialValue: '',
              onChanged: (value) {
                product = product.copyWith(description: value);
              },
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  BlocProvider.of<ProductBloc>(context).add(
                    AddProduct(product: product),
                  );

                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(200, 40),
                ),
                child: Text(
                  'Save',
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
