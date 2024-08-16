import 'package:equatable/equatable.dart';

import '../../domain/entities/food.dart';
import '../../domain/entities/nutrient.dart';
import 'nutrient_model.dart';

class FoodModel extends Equatable {
  final String dataType;
  final String description;
  final int fdcId;
  final String publicationDate;
  final String foodCode;

  const FoodModel({
    required this.dataType,
    required this.description,
    required this.fdcId,
    required this.publicationDate,
    required this.foodCode,
  });

  // Factory constructor for creating a FoodModel from a Map (e.g., JSON)
  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      dataType: json['dataType'] ?? '',
      description: json['description'] ?? '',
      fdcId: json['fdcId'] as int,
      publicationDate: json['publicationDate'] ?? '',
      foodCode: json['foodCode'] ?? '',
    );
  }

  Food toDomain() {
    return Food(
      dataType: dataType,
      description: description,
      fdcId: fdcId,
      publicationDate: publicationDate,
      foodCode: foodCode,
    );
  }

  @override
  List<Object?> get props => [
        dataType,
        description,
        fdcId,
        publicationDate,
        foodCode,
      ];
}