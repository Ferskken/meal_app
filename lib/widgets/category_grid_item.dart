import 'package:flutter/material.dart';
import 'package:meal_app/models/category.dart'; // Import the Category model

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem(
      {super.key, required this.category, required this.onSelectCategory});

  final Category category; // The category to display
  final void Function()
      onSelectCategory; // Callback function when the category is selected

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectCategory, // Trigger the onTap callback when tapped
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(colors: [
            category.color.withOpacity(0.50),
            category.color.withOpacity(0.9)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Text(
          category.title, // Display the category title
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}
