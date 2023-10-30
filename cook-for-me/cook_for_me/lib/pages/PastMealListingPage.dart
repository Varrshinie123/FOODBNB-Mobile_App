import 'package:flutter/material.dart';

class PastMealListingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Past Meal Listings'),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Text(
          'This is the Past Meal Listings Page',
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
