import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';
import 'meal_details_view.dart';

class MealsView extends StatelessWidget {
  const MealsView(
      {super.key,
      this.title,
      required this.meals,
      required this.coloritem,
      });

  final String? title;
  final Color coloritem;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return title == null
        ? content(context)
        : Scaffold(
            appBar: AppBar(
              title: Text(
                title!,
                style: TextStyle(color: coloritem),
              ),
            ),
            body: content(context),
          );
  }

  SingleChildScrollView content(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            children: meals
                .map(
                  (e) => MealItem(
                    meal: e,
                    onSelectMeal: (Meal meal) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return MealDetails(
                          meal: meal,
                        );
                      }));
                    },
                  ),
                )
                .toList()),
      ),
    );
  }
}
