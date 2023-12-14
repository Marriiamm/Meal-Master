import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitchen/Providers/favorites_provider.dart';
import 'package:kitchen/Providers/navbar_provider.dart';
import 'package:kitchen/views/category_screen.dart';
import 'package:kitchen/views/meals.dart';
import '../Providers/filters_provider.dart';
import '../models/meal.dart';
import '../widgets/main_drawer.dart';
import 'filters_view.dart';



class TapsViews extends ConsumerWidget {
  const TapsViews({super.key});
  
  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Meal> availableMealss = ref.watch(filteredMealsProvider); 
     final selectedPageIndex =ref.watch(navBarProvider); 
    Widget activePage = CategoryScreen(
      availableMeals: availableMealss,
    );
    var activePageTitle = "Categories";
    if (selectedPageIndex == 1) {
      final List<Meal> favoriteMeal = ref.watch(favoritiesMealProvider);
      activePage = MealsView(
        meals: favoriteMeal,
        coloritem: Colors.black38,
      );
      activePageTitle = "Favorities";
    }
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(activePageTitle),
      ),
      body: activePage,
      drawer: MianDrawer(
        onSelectScreen: (String identifier){
           Navigator.of(context).pop();
          if (identifier == "filters") {
          Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) {
          return  const FiltersView();
        })
        );
      }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedPageIndex,
        onTap: ref.read(navBarProvider.notifier).setPage,
        items: [
          BottomNavigationBarItem(
              label: "Categories",
              icon: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.set_meal_rounded))),
          BottomNavigationBarItem(
              label: "favorites",
              icon: IconButton(onPressed: () {}, icon: const Icon(Icons.star))),
        ],
      ),
    );
  }
}
