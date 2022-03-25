import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String? id;
  final String? restaurantId;
  final String name;
  final String category;
  final String description;
  final String imageUrl;
  final double price;
  // final int? index;

  const Product({
    this.id,
    required this.restaurantId,
    required this.name,
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.price,
    // this.index,
  });

  Product copyWith({
    String? id,
    String? restaurantId,
    String? name,
    String? category,
    String? description,
    String? imageUrl,
    double? price,
    // int? index,
  }) {
    return Product(
      id: id ?? this.id,
      restaurantId: restaurantId ?? this.restaurantId,
      name: name ?? this.name,
      category: category ?? this.category,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      // index: index ?? this.index,
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'id': id,
      'restaurantId': restaurantId,
      'name': name,
      'category': category,
      'description': description,
      'imageUrl': imageUrl,
      'price': price,
    };
  }

  factory Product.fromSnapshot(Map<String, dynamic> snap) {
    return Product(
      id: snap['id'].toString(),
      restaurantId: snap['restaurantId'],
      name: snap['name'],
      category: snap['category'],
      description: snap['description'],
      imageUrl: snap['imageUrl'],
      price: snap['price'],
      // index: snap['index'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        restaurantId,
        name,
        category,
        description,
        price,
        imageUrl,
        // index,
      ];

  static List<Product> products = const [
    Product(
      id: '1',
      restaurantId: 'MbyvrvKY1hdNohNU11EL',
      name: 'Margherita',
      category: 'Pizza',
      description: 'Tomatoes, mozzarella, basil',
      price: 4.99,
      imageUrl:
          'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    ),
    Product(
      id: '2',
      restaurantId: 'MbyvrvKY1hdNohNU11EL',
      name: '4 Formaggi',
      category: 'Pizza',
      description: 'Tomatoes, mozzarella, basil',
      price: 4.99,
      imageUrl:
          'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    ),
    Product(
      id: '3',
      restaurantId: 'MbyvrvKY1hdNohNU11EL',
      name: 'Baviera',
      category: 'Pizza',
      description: 'Tomatoes, mozzarella, basil',
      price: 4.99,
      imageUrl:
          'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    ),
    Product(
      id: '4',
      restaurantId: 'MbyvrvKY1hdNohNU11EL',
      name: 'Baviera',
      category: 'Pizza',
      description: 'Tomatoes, mozzarella, basil',
      price: 4.99,
      imageUrl:
          'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    ),
    Product(
      id: '5',
      restaurantId: 'MbyvrvKY1hdNohNU11EL',
      name: 'Coca Cola',
      category: 'Drinks',
      description: 'A fresh drink',
      price: 1.99,
      imageUrl:
          'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    ),
    Product(
      id: '6',
      restaurantId: 'MbyvrvKY1hdNohNU11EL',
      name: 'Coca Cola',
      category: 'Drinks',
      description: 'A fresh drink',
      price: 1.99,
      imageUrl:
          'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    ),
    Product(
      id: '7',
      restaurantId: 'MbyvrvKY1hdNohNU11EL',
      name: 'Coca Cola',
      category: 'Drinks',
      description: 'A fresh drink',
      price: 1.99,
      imageUrl:
          'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    ),
    Product(
      id: '8',
      restaurantId: 'MbyvrvKY1hdNohNU11EL',
      name: 'Water',
      category: 'Drinks',
      description: 'A fresh drink',
      price: 1.99,
      imageUrl:
          'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    ),
    Product(
      id: '9',
      restaurantId: 'MbyvrvKY1hdNohNU11EL',
      name: 'Caesar Salad',
      category: 'Salads',
      description: 'A fresh drink',
      price: 1.99,
      imageUrl:
          'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    ),
    Product(
      id: '10',
      restaurantId: 'MbyvrvKY1hdNohNU11EL',
      name: 'CheeseBurger',
      category: 'Burgers',
      description: 'A burger with Cheese',
      price: 9.99,
      imageUrl:
          'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    ),
    Product(
      id: '11',
      restaurantId: 'MbyvrvKY1hdNohNU11EL',
      name: 'Chocolate Cake',
      category: 'Desserts',
      description: 'A cake with chocolate',
      price: 9.99,
      imageUrl:
          'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    )
  ];
}
