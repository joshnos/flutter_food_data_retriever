import '../models/food_model.dart';

abstract class FoodRemoteDataSource {
  Future<FoodModel> getFoodDetails(int foodId);
}