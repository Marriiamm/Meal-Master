import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../models/meal.dart';
import '../widgets/category_grid_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen(
      {super.key, required this.availableMeals});
  final List<Meal> availableMeals;

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 2 / 2),
      children: [
        for (final category in availableCategories)
          GridItem(
            category: category, 
            availableMeals: availableMeals,
          )
      ],
    );
  }
}
