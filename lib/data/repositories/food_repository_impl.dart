import 'package:dartz/dartz.dart';

import '../../core/errors/exceptions.dart';
import '../../core/errors/failures.dart';
import '../../core/network/network_info.dart';
import '../entities/food.dart';
import '../repositories/food_repository.dart';
import '../../core/util/input_converter.dart';
import '../../data/datasources/food_remote_data_source.dart';
import '../../data/models/food_model.dart';

class FoodRepositoryImpl implements FoodRepository {
  final FoodRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  final InputConverter inputConverter;

  FoodRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
    required this.inputConverter,
  });

  @override
  Future<Either<Failure, Food>> getFoodDetails(int foodId) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteFood = await remoteDataSource.getFood(foodId);
        return Right(remoteFood.toDomain());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoInternetConnection());
    }
  }
}