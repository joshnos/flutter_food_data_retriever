import 'package:dartz/dartz.dart';

import '../../core/errors/failures.dart';
import '../../core/errors/failures.dart';
import '../../core/network/network_info.dart';
import '../../domain/entities/food.dart';
import '../../domain/repositories/food_repository.dart';
import '../../data/datasources/food_remote_data_source.dart';
import '../../data/models/food_model.dart';

class FoodRepositoryImpl implements FoodRepository {
  final FoodRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  FoodRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Food>> getFoodDetails(int foodId) async {
    if (networkInfo.isConnected) {
      try {
        final remoteFood = await remoteDataSource.getFoodDetails(foodId);
        return Right(remoteFood.toDomain());
      } on ServerFailure {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoInternetConnection());
    }
  }
}