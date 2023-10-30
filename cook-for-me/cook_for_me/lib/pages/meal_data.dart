import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user_data.dart'; // Import UserDataProvider class
import 'meal_data.dart'; // Import MealDataProvider class

class ChangeMealPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userName = Provider.of<UserDataProvider>(context).userName;
    final userMeals = Provider.of<MealDataProvider>(context).getUserMeals(userName);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Meals'),
      ),
      body: ListView.builder(
        itemCount: userMeals.length,
        itemBuilder: (context, index) {
          final meal = userMeals[index];
          return ListTile(
            title: Text('Meal Name: ${meal.name}'),
            subtitle: Text('Price: \$${meal.price.toStringAsFixed(2)}'),
            trailing: ElevatedButton(
              onPressed: () {
                // Handle meal deletion logic here
                // Call a function to delete the meal from the provider
                Provider.of<MealDataProvider>(context, listen: false).deleteMeal(meal);

                // You can add further logic here if needed

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Meal deleted.'),
                  ),
                );
              },
              child: Text('Delete'),
            ),
          );
        },
      ),
    );
  }
}

class MealDataProvider extends ChangeNotifier {
  final List<Meal> _meals = []; // Your list of meals

  // Function to delete a meal
  void deleteMeal(Meal meal) {
    _meals.remove(meal);
    notifyListeners();
  }

  // Function to get meals for a specific user
  List<Meal> getUserMeals(String userName) {
    return _meals.where((meal) => meal.userName == userName).toList();
  }

  // Add other meal management functions as needed

  // Rest of the MealDataProvider class
}

class Meal {
  final String userName;
  final String name;
  final double price;

  Meal({
    required this.userName,
    required this.name,
    required this.price,
  });
}

