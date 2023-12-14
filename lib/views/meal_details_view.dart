import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitchen/Providers/favorites_provider.dart';
import 'package:kitchen/models/meal.dart';

class MealDetails extends ConsumerWidget {
  const MealDetails({super.key, required this.meal});
  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeal =ref.watch(favoritiesMealProvider);
    final bool isfavorite = favoriteMeal.contains(meal);
    return Scaffold(
        appBar: AppBar(
          title: Text(meal.title),
          actions: [
            IconButton(
                onPressed: () {
                  final wasAdded =  ref
                      .read(favoritiesMealProvider.notifier)
                      .toggleFavoriteMeal(meal);
                    
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context)
                      .showSnackBar(
                        SnackBar(content: Text(
                          wasAdded?"meal added to favorites"
                          :"meal is no lonfer in favorites")));
                },
                icon:  Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Icon(Icons.star,color: isfavorite? Colors.red:Colors.grey.withOpacity(0.4),),
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      meal.imageUrl,
                    )),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Ingradiants",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              const Divider(
                indent: 70,
                endIndent: 70,
              ),
              const SizedBox(
                height: 10,
              ),
              for (final ingradiant in meal.ingredients)
                Text(
                  ingradiant,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              const Divider(
                indent: 30,
                endIndent: 30,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Steps",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              const Divider(
                indent: 70,
                endIndent: 70,
              ),
              const SizedBox(
                height: 10,
              ),
              for (final steps in meal.steps)
                Text(
                  steps,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              const Divider(
                indent: 30,
                endIndent: 30,
              ),
            ],
          ),
        ));
  }
}
