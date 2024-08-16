import 'package:equatable/equatable.dart';

import 'nutrient.dart';

class Food extends Equatable {
  final String dataType;
  final String description;
  final int fdcId;
  final String publicationDate;
  final String foodCode;

  const Food({
    required this.dataType,
    required this.description,
    required this.fdcId,
    required this.publicationDate,
    required this.foodCode,
  });

  @override
  List<Object?> get props => [
        dataType,
        description,
        fdcId,
        publicationDate,
        foodCode,
      ];
}