part of 'food_bloc.dart';

abstract class FoodEvent extends Equatable {
  const FoodEvent();

  @override
  List<Object> get props => [];
}

class GetFoodDetails extends FoodEvent {
  final int foodId;

  const GetFoodDetails(this.foodId);

  @override
  List<Object> get props => [foodId];
}