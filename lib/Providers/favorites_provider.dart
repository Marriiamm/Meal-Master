import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/meal.dart';

class FavoritiesMealNotifier extends StateNotifier<List<Meal>>{
  FavoritiesMealNotifier(): super([]);
  bool toggleFavoriteMeal(Meal meal) {
    final isExiting = state.contains(meal);
    if (isExiting) {    
        state = state.where((element) => element.id != meal.id).toList();
      return false;
    } else {  
        state = [...state,meal];
      return true;
    }
  }
}
final favoritiesMealProvider = 
StateNotifierProvider<FavoritiesMealNotifier,List<Meal>>((ref) {
  return FavoritiesMealNotifier();
});