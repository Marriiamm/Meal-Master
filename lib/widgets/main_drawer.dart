import 'package:flutter/material.dart';

class MianDrawer extends StatelessWidget {
  const MianDrawer({super.key, required this.onSelectScreen});

  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xffFECE52),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.fastfood_rounded,
                      size: 60,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Meal Master",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )
                  ],
                )),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(31, 151, 147, 147),
              ),
              child: ListTile(
                onTap: () {
                  onSelectScreen('meals');
                },
                leading: const Icon(Icons.restaurant),
                title: const Text(
                  "Meals",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(31, 151, 147, 147),
              ),
              child: ListTile(
                onTap: () {
                  onSelectScreen("filters");
                },
                leading: const Icon(Icons.settings),
                title: const Text(
                  "filters",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
