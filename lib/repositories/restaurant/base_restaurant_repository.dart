import '/models/models.dart';

abstract class BaseRestaurantRepository {
  Future<void> addRestaurant(Restaurant restaurant);
  Future<void> editRestaurant();
  Stream<Restaurant> getRestaurant();
}
