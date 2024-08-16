import 'package:dartz/dartz.dart';

import '../../core/errors/failures.dart';
import '../entities/food.dart';

abstract class FoodRepository {
  Future<Either<Failure, Food>> getFoodDetails(int foodId);
}