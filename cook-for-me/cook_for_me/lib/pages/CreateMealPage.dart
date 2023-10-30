import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'user_data.dart'; // Import UserDataProvider class

class CreateMealPage extends StatefulWidget {
  @override
  _CreateMealPageState createState() => _CreateMealPageState();
}

class _CreateMealPageState extends State<CreateMealPage> {
  TextEditingController mealNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  void _createMeal() async {
    String mealName = mealNameController.text;
    String description = descriptionController.text;
    double price = double.tryParse(priceController.text) ?? 0.0;

    if (mealName.isNotEmpty && description.isNotEmpty) {
      try {
        final user = FirebaseAuth.instance.currentUser; // Get the currently logged-in user
        var userName = user?.displayName ?? 'Anonymous'; // Get the user's display name or use 'Anonymous' as a default

        // Retrieve the user's name from the UserDataProvider provider
        final userProvider = Provider.of<UserDataProvider>(context, listen: false);
        final userNameFromProvider = userProvider.userName;

        // Use the user's name from the provider if available
        if (userNameFromProvider.isNotEmpty) {
          userName = userNameFromProvider;
        }

        // Save the meal data to Firestore
        await FirebaseFirestore.instance.collection('meal_listings').add({
          'name': mealName,
          'description': description,
          'price': price,
          'lister': userName, // Include the user's display name as the author in the document
        });

        // After successful creation, you can navigate back
        Navigator.pop(context);
      } catch (e) {
        print('Error creating meal: $e');
      }
    } else {
      // Handle validation, e.g., show an error message.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Meal'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: mealNameController,
              decoration: InputDecoration(
                labelText: 'Meal Name',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: priceController,
              decoration: InputDecoration(
                labelText: 'Price',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _createMeal, // Call the create meal function
              child: Text('Create Meal'),
            ),
          ],
        ),
      ),
    );
  }
}
