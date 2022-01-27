import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final String name;
  final String category;
  final String description;
  final String imageUrl;
  final double price;
  final int index;

  const Product({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.index,
  });

  Product copyWith({
    String? id,
    String? name,
    String? category,
    String? description,
    String? imageUrl,
    double? price,
    int? index,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      index: index ?? this.index,
    );
  }

  factory Product.fromSnapshot(Map<String, dynamic> snap) {
    return Product(
      id: snap['id'],
      name: snap['name'],
      category: snap['category'],
      description: snap['description'],
      imageUrl: snap['imageUrl'],
      price: snap['price'],
      index: snap['index'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        category,
        description,
        price,
        imageUrl,
        index,
      ];

  static List<Product> products = const [
    Product(
      id: '1',
      name: 'Margherita',
      category: 'Pizza',
      description: 'Tomatoes, mozzarella, basil',
      price: 4.99,
      imageUrl:
          'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      index: 0,
    ),
    Product(
      id: '2',
      name: '4 Formaggi',
      category: 'Pizza',
      description: 'Tomatoes, mozzarella, basil',
      price: 4.99,
      imageUrl:
          'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      index: 1,
    ),
    Product(
      id: '3',
      name: 'Baviera',
      category: 'Pizza',
      description: 'Tomatoes, mozzarella, basil',
      price: 4.99,
      imageUrl:
          'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      index: 2,
    ),
    Product(
      id: '4',
      name: 'Baviera',
      category: 'Pizza',
      description: 'Tomatoes, mozzarella, basil',
      price: 4.99,
      imageUrl:
          'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      index: 3,
    ),
    Product(
      id: '5',
      name: 'Coca Cola',
      category: 'Drink',
      description: 'A fresh drink',
      price: 1.99,
      imageUrl:
          'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      index: 4,
    ),
    Product(
      id: '6',
      name: 'Coca Cola',
      category: 'Drink',
      description: 'A fresh drink',
      price: 1.99,
      imageUrl:
          'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      index: 5,
    ),
    Product(
      id: '7',
      name: 'Coca Cola',
      category: 'Drink',
      description: 'A fresh drink',
      price: 1.99,
      imageUrl:
          'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      index: 6,
    ),
    Product(
      id: '8',
      name: 'Water',
      category: 'Drink',
      description: 'A fresh drink',
      price: 1.99,
      imageUrl:
          'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      index: 7,
    ),
    Product(
      id: '9',
      name: 'Caesar Salad',
      category: 'Salad',
      description: 'A fresh drink',
      price: 1.99,
      imageUrl:
          'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      index: 8,
    ),
    Product(
      id: '10',
      name: 'CheeseBurger',
      category: 'Burger',
      description: 'A burger with Cheese',
      price: 9.99,
      imageUrl:
          'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      index: 9,
    ),
    Product(
      id: '11',
      name: 'Chocolate Cake',
      category: 'Desser',
      description: 'A cake with chocolate',
      price: 9.99,
      imageUrl:
          'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      index: 10,
    )
  ];
}
