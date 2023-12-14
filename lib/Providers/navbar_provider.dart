import 'package:flutter_riverpod/flutter_riverpod.dart';

//import 'meals_provider.dart';

enum Filters{
  freeGlutainFilter,
  isVegan,
  isVegetarian,
  isLactoseFree,
}
class NvBarNotifier extends StateNotifier<int>{
  NvBarNotifier(): super(0);

  void setPage(int index) {   
    state =index;
  }
  
}

final navBarProvider = StateNotifierProvider<NvBarNotifier,int>((_) {
  return NvBarNotifier();
});