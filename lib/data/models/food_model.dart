import 'package:equatable/equatable.dart';

import '../../domain/entities/food.dart';
import '../../domain/entities/nutrient.dart';
import 'nutrient_model.dart';

class FoodModel extends Equatable {
  final String dataType;
  final String description;
  final int fdcId;
  final List<Nutrient> foodNutrients;
  final String publicationDate;
  final String? brandOwner;
  final String? gtinUpc;
  final int? ndbNumber;
  final String foodCode;

  const FoodModel({
    required this.dataType,
    required this.description,
    required this.fdcId,
    required this.foodNutrients,
    required this.publicationDate,
    this.brandOwner,
    this.gtinUpc,
    this.ndbNumber,
    required this.foodCode,
  });

  // Factory constructor for creating a FoodModel from a Map (e.g., JSON)
  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      dataType: json['dataType'],
      description: json['description'],
      fdcId: json['fdcId'],
      foodNutrients: (json['foodNutrients'] as List)
          .map((nutrient) => NutrientModel.fromJson(nutrient))
          .toList(),
      publicationDate: json['publicationDate'],
      brandOwner: json['brandOwner'],
      gtinUpc: json['gtinUpc'],
      ndbNumber: json['ndbNumber'],
      foodCode: json['foodCode'],
    );
  }

  Food toDomain() {
    return Food(
      dataType: dataType,
      description: description,
      fdcId: fdcId,
      foodNutrients: foodNutrients,
      publicationDate: publicationDate,
      brandOwner: brandOwner,
      gtinUpc: gtinUpc,
      ndbNumber: ndbNumber,
      foodCode: foodCode,
    );
  }

  @override
  List<Object?> get props => [
        dataType,
        description,
        fdcId,
        foodNutrients,
        publicationDate,
        brandOwner,
        gtinUpc,
        ndbNumber,
        foodCode,
      ];
}