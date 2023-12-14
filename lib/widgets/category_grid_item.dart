import 'package:kitchen/models/category.dart';
import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../views/meals.dart';

class GridItem extends StatelessWidget {
  const GridItem({super.key, required this.category, required this.availableMeals});
  final Category category;
  final List<Meal> availableMeals;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        splashColor: Colors.black.withOpacity(0.15),
        borderRadius: BorderRadius.circular(25),
        onTap: () {
          final filteredMeal = availableMeals
              .where((element) => element.categories.contains(category.id))
              .toList();
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => MealsView(
                      title: category.title,
                      meals: filteredMeal,
                      coloritem: category.color,
                    )),
          );
        },
        child: Container(
            constraints: const BoxConstraints.expand(),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: category.color.withOpacity(0.5),
              image: const DecorationImage(
                  image: AssetImage("assets/images/back.png"),
                  fit: BoxFit.cover),
            ),
            child: Center(
                child: Text(
              category.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ))),
      ),
    );
  }
}
