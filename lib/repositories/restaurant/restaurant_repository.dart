import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_food_delivery_backend/models/restaurant_model.dart';
import 'package:flutter_food_delivery_backend/repositories/restaurant/base_restaurant_repository.dart';

class RestaurantRepository extends BaseRestaurantRepository {
  final FirebaseFirestore _firebaseFirestore;

  RestaurantRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<void> addRestaurant(Restaurant restaurant) async {
    await _firebaseFirestore
        .collection('restaurants')
        .add(restaurant.toDocument());
  }

  @override
  Future<void> editRestaurant() {
    // TODO: implement editRestaurant
    throw UnimplementedError();
  }

  @override
  Stream<Restaurant> getRestaurant() {
    return _firebaseFirestore
        .collection('restaurants')
        .doc('MbyvrvKY1hdNohNU11EL')
        .snapshots()
        .map((snapshot) {
      return Restaurant.fromSnapshot(snapshot);
    });
  }
}
