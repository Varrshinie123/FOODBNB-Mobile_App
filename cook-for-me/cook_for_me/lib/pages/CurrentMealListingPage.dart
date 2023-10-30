import 'package:flutter/material.dart';

class CurrentMealListingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Current Meal Listings'),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Text(
          'This is the Current Meal Listings Page',
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
