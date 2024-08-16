import 'package:equatable/equatable.dart';
import '../../domain/entities/nutrient.dart';

class NutrientModel extends Nutrient {
  const NutrientModel({
    required int number,
    required String name,
    required double amount,
    required String unitName,
    required String derivationCode,
    required String derivationDescription,
  }) : super(
          number: number,
          name: name,
          amount: amount,
          unitName: unitName,
          derivationCode: derivationCode,
          derivationDescription: derivationDescription,
        );

  factory NutrientModel.fromJson(Map<String, dynamic> json) {
    return NutrientModel(
      number: json['number'] as int,
      name: json['name'] as String,
      amount: (json['amount'] as num).toDouble(),
      unitName: json['unitName'] as String,
      derivationCode: json['derivationCode'] as String,
      derivationDescription: json['derivationDescription'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'number': number,
      'name': name,
      'amount': amount,
      'unitName': unitName,
      'derivationCode': derivationCode,
      'derivationDescription': derivationDescription,
    };
  }
}
