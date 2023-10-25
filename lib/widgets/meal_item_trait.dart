import 'package:flutter/material.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait({super.key, required this.icon, required this.label});

  final IconData icon; // The icon to display
  final String label; // The label associated with the icon

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 17,
          color: Colors.white, // Style for the icon
        ),
        SizedBox(
          width: 6,
        ),
        Text(
          label,
          style: TextStyle(color: Colors.white),
        ) // Display the label with white text color
      ],
    );
  }
}
