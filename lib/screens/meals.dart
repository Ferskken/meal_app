import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/meal_details.dart';
import 'package:meal_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {super.key,
      this.title,
      required this.meals,
      required this.onToggleFavorite});

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFavorite;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(
          meal: meal,
          onToggleFavorite: onToggleFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Initialize a placeholder content widget for when no meals are available
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Oh no!",
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ), // Display a headline
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(16), // Add padding around the text
            child: Text(
              "Looks like this category is empty! Try selecting a different category",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
              textAlign: TextAlign.center, // Center-align the text
            ),
          ),
        ],
      ),
    );

    // Check if there are meals available, and display them if present
    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) => MealItem(
            meal: meals[index],
            onSelectMeal: (meal) {
              selectMeal(
                  context, meal); // Function to select and view meal details
            }),
      );
    }

    // Check if a title is provided, and display the content within a scaffold
    if (title == null) {
      return content; // If no title, display the content directly
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body:
            content); // If a title is provided, display the content within a scaffold
  }
}
