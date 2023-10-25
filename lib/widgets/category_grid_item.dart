import 'package:flutter/material.dart';
import 'package:meal_app/models/category.dart'; // Import the Category model

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem(
      {super.key, required this.category, required this.onSelectCategory});

  final Category category; // The category to display
  final void Function()
      onSelectCategory; // Callback function when the category is selected

// Define a constant variable for borderRadius
  static BorderRadius gridItemBorderRadius = BorderRadius.circular(30);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectCategory, // Trigger the onTap callback when tapped
      // splashColor: Theme.of(context).primaryColor,
      borderRadius: gridItemBorderRadius,
      child: Stack(
        children: [
          // Using ClipRRect to add rounded edges to the image
          ClipRRect(
            borderRadius: gridItemBorderRadius,
            child: Image.network(
              category.imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          // Useing ClipRRect to add rounded edges to the gradient
          ClipRRect(
            borderRadius: gridItemBorderRadius,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Text(
                category.title,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      //backgroundColor: Colors.black45
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
