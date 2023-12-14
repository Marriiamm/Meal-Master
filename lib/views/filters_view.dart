import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Providers/filters_provider.dart';
//import '../widgets/main_drawer.dart';
//import 'taps_screens.dart';

class FiltersView extends ConsumerWidget {
  const FiltersView({super.key});


  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final Map<Filters,bool> selestdFilters =ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            switchContent(context,
            "Free-Glutain",
            "only include Free-Glutain meals",
            selestdFilters[Filters.freeGlutainFilter]!,
            (bool value) {
              ref.read(filtersProvider.notifier).setFilter(Filters.freeGlutainFilter,value);
          },),
            const SizedBox(height: 12,),
            switchContent(context,
            "Vegan",
            "only include Vegan meals",
            selestdFilters[Filters.isVegan]!,
            (bool value) {
              ref.read(filtersProvider.notifier).setFilter(Filters.isVegan,value);
          },),
            const SizedBox(height: 12,),
            switchContent(context,
            "Vegetarian",
            "only include Vegetarian meals",
            selestdFilters[Filters.isVegetarian]!,
            (bool value) {
              ref.read(filtersProvider.notifier).setFilter(Filters.isVegetarian,value);
          },),
            const SizedBox(height: 12,),
            switchContent(context,
            "Free-Lactose",
            "only include Free-Lactose meals",
            selestdFilters[Filters.isLactoseFree]!,
            (bool value) {
              ref.read(filtersProvider.notifier).setFilter(Filters.isLactoseFree,value);
          },),    
          ],
        ),
      ),
    );
  }

  Container switchContent(BuildContext context,String title ,String supTitle,bool filter,Function(bool newValue) applyFilter) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromARGB(31, 151, 147, 147),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SwitchListTile(
          activeColor: Colors.white,
          activeTrackColor: const Color(0xffFECE52),
          value: filter,
          onChanged: applyFilter,
          title:  Text(
            title,
            style: const TextStyle(
              fontSize: 22,
            ),
          ),
          subtitle:  Text(
            supTitle,
            style: const TextStyle(fontSize: 14, color: Colors.black45),
          ),
        ),
      ),
    );
  }
}

