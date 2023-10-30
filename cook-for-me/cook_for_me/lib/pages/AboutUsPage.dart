import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
        centerTitle: true,
        backgroundColor: Colors.orange, // Set app bar color to orange
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Welcome to Foodbnb!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Text color
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Foodbnb is a platform that connects people who love cooking with those who love homemade meals. Whether you\'re a home chef looking to share your culinary creations or someone who enjoys delicious homemade food, Foodbnb is the place for you.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black, // Text color
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Our mission is to bring communities together through the joy of food. We believe that sharing a meal is more than just eating; it\'s about creating connections, sharing stories, and fostering a sense of belonging.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black, // Text color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
