import '../../domain/entities/food.dart';

abstract class FoodRemoteDataSource {
  Future<Food> getFood(int foodId);
}