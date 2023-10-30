import 'package:flutter/material.dart';

class ChangeMealPage extends StatefulWidget {
  @override
  _ChangeMealPageState createState() => _ChangeMealPageState();
}

class _ChangeMealPageState extends State<ChangeMealPage> {
  TextEditingController mealNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Meal'),
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
            ElevatedButton(
              onPressed: () {
                // Handle meal change logic here
                String mealName = mealNameController.text;
                String description = descriptionController.text;

                // Perform meal change, e.g., update data on a server
                // You can add validation and further logic here

                // After successful change, you can navigate back
                Navigator.pop(context);
              },
              child: Text('Change Meal'),
            ),
          ],
        ),
      ),
    );
  }
}
