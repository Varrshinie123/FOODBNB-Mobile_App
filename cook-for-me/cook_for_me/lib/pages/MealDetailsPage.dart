import 'package:flutter/material.dart';
import 'package:cook_for_me/pages/MealListingsPage.dart';

class MealDetailsPage extends StatelessWidget {
  final List<Meal> meals;

  MealDetailsPage({
    required this.meals,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Details'),
      ),
      body: ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) {
          final meal = meals[index];
          return ListTile(
            title: Text(
              'Meal Name: ${meal.name}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Lister: ${meal.lister}', // Display the author
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  'Price: \$${meal.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  'Description: ${meal.description}',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
