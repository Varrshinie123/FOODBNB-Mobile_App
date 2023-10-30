import 'package:flutter/material.dart';

class RecommendationsPage extends StatelessWidget {
  // Dummy data for recommended meals (you can replace this with your own logic)
  final List<Meal> recommendedMeals = [
    Meal(id: 1, name: 'Recommended Meal 1', description: 'Description 1'),
    Meal(id: 2, name: 'Recommended Meal 2', description: 'Description 2'),
    Meal(id: 3, name: 'Recommended Meal 3', description: 'Description 3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recommended Meals'),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: ListView.builder(
        itemCount: recommendedMeals.length,
        itemBuilder: (context, index) {
          final meal = recommendedMeals[index];
          return ListTile(
            title: Text(meal.name),
            subtitle: Text(meal.description),
          );
        },
      ),
    );
  }
}

class Meal {
  final int id;
  final String name;
  final String description;

  Meal({
    required this.id,
    required this.name,
    required this.description,
  });
}
