import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../domain/entities/food.dart';
import '../../../../domain/usecases/get_food_details.dart';
import '../../../../domain/repositories/food_repository.dart';

part 'food_event.dart';
part 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  final FoodRepository repository;

  FoodBloc({required FoodRepository repository})
      : this.repository = repository,
        super(FoodInitial()) {
    on<GetFoodDetails>((event, emit) async {
      emit(FoodLoading());
      final failureOrFood = await repository.getFoodDetails(event.foodId);
      failureOrFood.fold(
        (failure) => emit(FoodError('failure')),
        (food) => emit(FoodLoaded(food)),
      );
    });
  }
}
