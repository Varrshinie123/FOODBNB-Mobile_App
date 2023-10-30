import 'package:flutter/material.dart';
import 'package:cook_for_me/pages/ActiveBookingPage.dart';
import 'package:cook_for_me/pages/RecommendationsPage.dart'; // Import RecommendationsPage
import 'package:cook_for_me/pages/HistoryPage.dart'; // Import HistoryPage
import 'package:cook_for_me/pages/CurrentMealListingPage.dart'; // Import CurrentMealListingPage
import 'package:cook_for_me/pages/PastMealListingPage.dart';

class ProfilePage extends StatelessWidget {
  final bool isHost; // Add a boolean property to determine if the user is a host

  ProfilePage({required this.isHost}); // Constructor to receive the isHost value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Options',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          if (!isHost)
            ListTile(
              leading: Icon(Icons.bookmark), // Icon for Active Booking
              title: Text('Active Booking'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ActiveBookingPage(),
                  ),
                );
              },
            ),
          if (!isHost)
            ListTile(
              leading: Icon(Icons.star), // Icon for Recommendations
              title: Text('Recommendations for You'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecommendationsPage(), // Navigate to RecommendationsPage
                  ),
                );
              },
            ),
          if (!isHost)
            ListTile(
              leading: Icon(Icons.history), // Icon for History
              title: Text('History'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HistoryPage(), // Navigate to HistoryPage
                  ),
                );
              },
            ),
          // Conditionally show these options based on whether the user is a host
          if (isHost)
            ListTile(
              leading: Icon(Icons.restaurant_menu), // Icon for Current Meal Listings
              title: Text('Current Meal Listings'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CurrentMealListingPage(), // Navigate to CurrentMealListingPage
                  ),
                );
              },
            ),
          if (isHost)
            ListTile(
              leading: Icon(Icons.history), // Icon for Past Meal Listings
              title: Text('Past Meal Listings'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PastMealListingPage(), // Navigate to PastMealListingPage
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
