import 'package:flutter/material.dart';
import 'add_meal_page.dart';
import 'diet_history_page.dart';
import 'food_search_page.dart';
import 'calorie_summary_page.dart';

class DietHome extends StatelessWidget {
  const DietHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          _DietButton(
            title: "Add Meal",
            icon: Icons.restaurant,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const AddMealPage(),
                ),
              );
            },
          ),

          const SizedBox(height: 20),

          _DietButton(
            title: "Diet History",
            icon: Icons.history,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const DietHistoryPage(),
                ),
              );
            },
          ),

          const SizedBox(height: 20),

          _DietButton(
            title: "Search Food",
            icon: Icons.search,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const FoodSearchPage(),
                ),
              );
            },
          ),

          const SizedBox(height: 20),

          _DietButton(
            title: "Calorie Summary",
            icon: Icons.local_fire_department,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const CalorieSummaryPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _DietButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const _DietButton({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: Icon(icon),
        label: Text(title),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 18),
        ),
      ),
    );
  }
}