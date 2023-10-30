import 'package:flutter/material.dart';
import 'package:cook_for_me/pages/ProfilePage.dart';
import 'package:cook_for_me/pages/AboutUsPage.dart';
import 'package:cook_for_me/pages/CreateMealPage.dart';
import 'package:cook_for_me/pages/MealListingsPage.dart';
import 'package:cook_for_me/pages/ChangeMealsPage.dart';

class CustomOptionsPage extends StatelessWidget {
  final bool? isHost;
  final String? displayName;

  CustomOptionsPage({required this.isHost, this.displayName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isHost == true ? 'Host Options' : 'Guest Options'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to Foodbnb!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              isHost == true
                  ? 'You are logged in as a Host.'
                  : 'You are logged in as a Guest.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AboutUsPage(),
                  ),
                );
              },
              child: Text('About Us'),
            ),
            SizedBox(height: 16),
            if (isHost != true) ...[
              ElevatedButton(
                onPressed: () {
                  // Guest-specific options
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(isHost: false),
                    ),
                  );
                },
                child: Text('Profile Page'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Guest-specific options
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MealListingsPage(),
                    ),
                  );
                },
                child: Text('Meal Listings'),
              ),
            ],
            if (isHost == true) ...[
              ElevatedButton(
                onPressed: () {
                  // Host-specific options
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(isHost: true),
                    ),
                  );
                },
                child: Text('Profile Page'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Host-specific options
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateMealPage(),
                    ),
                  );
                },
                child: Text('Add Meal'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Host-specific options
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangeMealPage(),
                    ),
                  );
                },
                child: Text('Change Meal'),
              ),
            ],
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Log out and navigate back to the login page
                Navigator.pop(context);
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
