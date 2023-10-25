import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/meals.dart';
import 'package:meal_app/widgets/category_grid_item.dart';
import 'package:meal_app/models/category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen(
      {super.key,
      required this.onToggleFavorite,
      required this.availableMeals});

  final void Function(Meal meal) onToggleFavorite;
  final List<Meal> availableMeals;

  // Function to handle category selection and navigate to MealsScreen
  void _selectCategory(BuildContext context, Category category) {
    // Filter meals based on the selected category
    final filteredMeals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    // Navigate to MealsScreen with filtered meals for the selected category
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title, // Title for MealsScreen
          meals: filteredMeals, // List of filtered meals
          onToggleFavorite:
              onToggleFavorite, // Function to handle favorite toggling
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns in the grid
        childAspectRatio: 3 / 2, // Aspect ratio for each grid item
        crossAxisSpacing: 20, // Spacing between columns
        mainAxisSpacing: 20, // Spacing between rows
      ),
      children: [
        // Create CategoryGridItem widgets for each available category
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCategory: () {
              // Handle category selection
              _selectCategory(context, category);
            },
          )
      ],
    );
  }
}
