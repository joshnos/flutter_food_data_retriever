import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../core/errors/failures.dart';
import '../../core/usecases/usecase.dart';
import '../../domain/entities/food.dart';
import '../../domain/repositories/food_repository.dart';

class GetFoodDetails implements UseCase<Food, int> {
  final FoodRepository repository;

  GetFoodDetails(this.repository);

  @override
  Future<Either<Failure, Food>> call(int foodId) async {
    return await repository.getFoodDetails(foodId);
  }
}