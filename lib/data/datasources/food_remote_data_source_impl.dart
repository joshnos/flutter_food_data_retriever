import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../core/errors/failures.dart';
import '../models/food_model.dart';
import 'food_remote_data_source.dart';

class FoodRemoteDataSourceImpl implements FoodRemoteDataSource {
  final Dio client;

  FoodRemoteDataSourceImpl({required this.client});

  @override
  Future<FoodModel> getFoodDetails(int foodId) async {
    final response = await client.get(
      'https://api.nal.usda.gov/fdc/v1/food/$foodId',
      queryParameters: {
        'format': 'abridged',
        'api_key': dotenv.env['API_KEY'],
      },
    );

    if (response.statusCode == 200) {
      return FoodModel.fromJson(response.data);
    } else {
      throw ServerFailure();
    }
  }
}
