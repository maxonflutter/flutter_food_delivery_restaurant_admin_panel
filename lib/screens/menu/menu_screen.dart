import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_backend/config/responsive.dart';
import 'package:flutter_food_delivery_backend/models/models.dart';
import '/widgets/widgets.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Restaurant Menu',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: Product.products.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ProductCard(
                              product: Product.products[index],
                              index: index,
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Responsive.isWideDesktop(context) ||
                            Responsive.isDesktop(context)
                        ? Container(
                            constraints: const BoxConstraints(
                              minHeight: 300,
                              maxHeight: 1000,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: _buildCategories(context),
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: _buildProducts(context),
                                ),
                              ],
                            ),
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildCategories(context),
                              const SizedBox(height: 20),
                              _buildProducts(context),
                            ],
                          ),
                    const SizedBox(height: 20),

                    // Placeholder for ads.
                    Container(
                      width: double.infinity,
                      constraints: const BoxConstraints(minHeight: 75),
                      color: Theme.of(context).colorScheme.primary,
                      child: const Center(
                        child: Text('Some ads here'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Section on the right side of the screen. Placeholder for ads.
          Responsive.isWideDesktop(context) || Responsive.isDesktop(context)
              ? Expanded(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.only(
                      top: 20.0,
                      bottom: 20.0,
                      right: 20.0,
                    ),
                    color: Theme.of(context).colorScheme.background,
                    child: const Center(
                      child: Text('Some ads here'),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  Container _buildProducts(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      color: Theme.of(context).colorScheme.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Products',
            style: Theme.of(context).textTheme.headline4,
          ),
          ...Product.products.map((product) {
            return ProductListTile(product: product);
          }).toList(),
        ],
      ),
    );
  }

  Container _buildCategories(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Categories',
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(height: 20),
          ...Category.categories.map((category) {
            return CategoryListTile(category: category);
          }).toList(),
        ],
      ),
    );
  }
}
