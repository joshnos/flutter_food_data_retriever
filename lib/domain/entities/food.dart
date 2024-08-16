import 'package:equatable/equatable.dart';

import './nutrient.dart';

class Food extends Equatable {
  final String dataType;
  final String description;
  final int fdcId;
  final List<Nutrient> foodNutrients;
  final String publicationDate;
  final String? brandOwner;
  final String? gtinUpc;
  final int? ndbNumber;
  final String foodCode;

  const Food({
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