import 'package:equatable/equatable.dart';

class Nutrient extends Equatable {
  final int number;
  final String name;
  final double amount;
  final String unitName;
  final String derivationCode;
  final String derivationDescription;

  const Nutrient({
    required this.number,
    required this.name,
    required this.amount,
    required this.unitName,
    required this.derivationCode,
    required this.derivationDescription,
  });

  @override
  List<Object?> get props => [number, name, amount, unitName, derivationCode, derivationDescription];
}
