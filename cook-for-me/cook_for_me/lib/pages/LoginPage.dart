import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cook_for_me/pages/CustomOptionsPage.dart';
import 'package:provider/provider.dart';
import 'user_data.dart'; // Import UserDataProvider class

class LoginPage extends StatelessWidget {
  final bool? loginAsHost;

  LoginPage({required this.loginAsHost});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> _performLogin(BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      if (userCredential.user != null) {
        // Retrieve user's display name from Firestore
        String displayName = await _fetchUserNameFromFirestore(userCredential.user!.uid);

        // Set the user's name in the UserDataProvider
        Provider.of<UserDataProvider>(context, listen: false).setUserName(displayName);

        // Navigate to the next page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => CustomOptionsPage(
              isHost: loginAsHost,
            ),
          ),
        );
      }
    } catch (e) {
      // Handle incorrect login credentials or other authentication errors
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Login Failed'),
            content: Text('Invalid email or password.'),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  Future<String> _fetchUserNameFromFirestore(String uid) async {
    try {
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance.collection('users').doc(uid).get();

      if (userSnapshot.exists) {
        // Extract the user's name from the Firestore document
        return userSnapshot.get('name'); // Assuming 'name' is the field that stores the display name
      } else {
        return 'User Name'; // Replace with a default name or handle the case where the document doesn't exist
      }
    } catch (e) {
      // Handle Firestore query errors
      print('Firestore error: $e');
      return 'User Name'; // Replace with a default name or handle the error accordingly
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(loginAsHost! ? 'Login as Host' : 'Login as Guest'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _performLogin(context);
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
