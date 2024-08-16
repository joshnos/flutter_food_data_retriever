import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test_app/core/errors/failures.dart';
import 'package:flutter_test_app/domain/entities/food.dart';
import 'package:flutter_test_app/domain/repositories/food_repository.dart';
import 'package:flutter_test_app/domain/usecases/get_food_details.dart';

class MockFoodRepository extends Mock implements FoodRepository {}

void main() {
  late GetFoodDetails usecase;
  late MockFoodRepository mockRepository;

  setUp(() {
    mockRepository = MockFoodRepository();
    usecase = GetFoodDetails(repository: mockRepository);
  });

  test('should return a Food', () async {
    // Arrange
    const food = Food(
      dataType: 'dataType',
      description: 'description',
      fdcId: 1,
      publicationDate: '2023-11-11',
      foodCode: 'code1',
    );
    when(mockRepository.getFoodDetails(any)).thenAnswer((_) async => Right(food));

    // Act
    final result = await usecase(123);

    // Assert
    expect(result, isA<Right>());
    expect(result.getOrElse(() => null), isA<Food>());
  });

  test('should return a Failure', () async {
    // Arrange
    const failure = ServerFailure(message: 'Server Error');
    when(mockRepository.getFoodDetails(any)).thenAnswer((_) async => Left(failure));

    // Act
    final result = await usecase(123);

    // Assert
    expect(result, isA<Left>());
    expect(result.fold((l) => l, (r) => null), isA<ServerFailure>());
  });
}