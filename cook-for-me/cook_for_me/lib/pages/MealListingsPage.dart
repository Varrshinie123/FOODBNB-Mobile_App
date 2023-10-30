import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cook_for_me/pages/MealDetailsPage.dart';

class MealListingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Listings'),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to Meal Listings!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final meals = await _fetchMealsFromFirestore();

                if (meals.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MealDetailsPage(meals: meals),
                    ),
                  );
                } else {
                  // Handle data retrieval error
                  _showDataRetrievalError(context);
                }
              },
              child: Text('View All Meals'),
            ),
          ],
        ),
      ),
    );
  }

  Future<List<Meal>> _fetchMealsFromFirestore() async {
    try {
      final mealQuery = await FirebaseFirestore.instance.collection('meal_listings').get();
      return mealQuery.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return Meal(
          name: data['name'] as String,
          description: data['description'] as String,
          price: (data['price'] as num).toDouble(),
          lister: data['lister'] as String, // Add author to the Meal object
        );
      }).toList();
    } catch (e) {
      print('Error fetching meal data: $e');
      return <Meal>[];
    }
  }

  void _showDataRetrievalError(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error retrieving meal data. Please try again.'),
      ),
    );
  }
}

class Meal {
  final String name;
  final String description;
  final double price;
  final String lister; // Add author property

  Meal({
    required this.name,
    required this.description,
    required this.price,
    required this.lister, // Initialize author
  });
}
