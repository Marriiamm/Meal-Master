import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'meals_provider.dart';

enum Filters{
  freeGlutainFilter,
  isVegan,
  isVegetarian,
  isLactoseFree,
}


class FiltersNotifier extends StateNotifier<Map<Filters, bool>>{
  FiltersNotifier(): super({
    Filters.freeGlutainFilter: false,
    Filters.isVegan: false,
    Filters.isVegetarian: false,
    Filters.isLactoseFree: false,
  });

  void setFilter(Filters filter, bool isActive) {   
    state ={...state,filter: isActive};
  }

  void setFilterss(Map<Filters, bool> chosenFilters) {   
    state =chosenFilters;
  }
  
}

final filtersProvider = StateNotifierProvider<FiltersNotifier,Map<Filters, bool>>((ref) {
  return FiltersNotifier();
});

final filteredMealsProvider = Provider((ref) {

  final meals =  ref.watch(mealsProvider);
  final Map<Filters,bool> selestdFilters =ref.watch(filtersProvider);
    
  return meals.where((meal) {
      if(selestdFilters[Filters.freeGlutainFilter]! && !meal.isGlutenFree){
        return false;
      }
      if(selestdFilters[Filters.isLactoseFree]! && !meal.isLactoseFree){
        return false;
      }
      if(selestdFilters[Filters.isVegan]! && !meal.isVegan){
        return false;
      }
      if(selestdFilters[Filters.isVegetarian]! && !meal.isVegetarian){
        return false;
      }
      return true;
    }).toList();
});