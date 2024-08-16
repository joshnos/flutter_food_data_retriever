import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_app/domain/entities/food.dart';

void main() {
  group('Food', () {
    const food = Food(
      dataType: 'dataType1',
      description: 'description1',
      fdcId: 123,
      publicationDate: '2023-11-11',
      foodCode: 'code1',
    );

    test('should create a food instance', () {
      expect(food, isA<Food>());
    });

    test('should have correct properties', () {
      expect(food.dataType, equals('dataType1'));
      expect(food.description, equals('description1'));
      expect(food.fdcId, equals(123));
      expect(food.publicationDate, equals('2023-11-11'));
      expect(food.foodCode, equals('code1'));
    });

    test('should support value equality', () {
      const food2 = Food(
        dataType: 'dataType1',
        description: 'description1',
        fdcId: 123,
        publicationDate: '2023-11-11',
        foodCode: 'code1',
      );

      expect(food, equals(food2));
    });

    test('should support value inequality', () {
      const food2 = Food(
        dataType: 'dataType2',
        description: 'description1',
        fdcId: 123,
        publicationDate: '2023-11-11',
        foodCode: 'code1',
      );

      expect(food, isNot(equals(food2)));
    });
  });
}