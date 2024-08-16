import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../core/errors/exceptions.dart';
import '../../data/models/food_model.dart';
import 'food_remote_data_source.dart';

const String apiKey = env['API_KEY'];

class FoodRemoteDataSourceImpl implements FoodRemoteDataSource {
  final http.Client client;

  FoodRemoteDataSourceImpl({required this.client});

  @override
  Future<Food> getFood(int foodId) async {
    final response = await client.get(Uri.parse('https://api.nal.usda.gov/fdc/v1/food/$foodId?format=abridged&nutrients=203&nutrients=204&nutrients=205&api_key=$apiKey'));

    if (response.statusCode == 200) {
      return FoodModel.fromJson(json.decode(response.body)).toDomain();
    } else {
      throw ServerException();
    }
  }
}