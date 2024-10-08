import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/food_bloc/food_bloc.dart';

class FoodPage extends StatelessWidget {
  final int foodId;

  const FoodPage({super.key, required this.foodId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Details'),
      ),
      body: BlocConsumer<FoodBloc, FoodState>(
        listener: (context, state) {
          if (state is FoodError) {
            // Handle error
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error:')),
            );
          }
        },
        builder: (context, state) {
          if (state is FoodInitial) {
            BlocProvider.of<FoodBloc>(context).add(GetFoodDetails(foodId));
            return const Center(child: CircularProgressIndicator());
          }
          if (state is FoodLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FoodLoaded) {
            final food = state.food;
            return Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Food description: ${food.description}'),
                Text('FDC ID: ${food.fdcId}'),
                Text('Publication Date: ${food.publicationDate}'),
                Text('Food Code: ${food.foodCode}'),
                Text('Data Type: ${food.dataType}'),
              ],
            ),
            );
          } else {
            return const Center(child: Text('No data available.'));
          }
        },
      ),
    );
  }
}
