import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateAccountPage extends StatefulWidget {
  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  String? _errorText;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late CollectionReference _usersCollection;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _usersCollection = _firestore.collection('users');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Account'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: passwordController,
              obscureText: true, // Keep password field obscured
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: addressController,
              decoration: InputDecoration(
                labelText: 'Address',
              ),
            ),
            SizedBox(height: 16),
            Text(
              _errorText ?? '', // Display error message if present
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () async {
                String name = nameController.text;
                String email = emailController.text;
                String password = passwordController.text; // Retrieve plain text password
                String address = addressController.text;

                try {
                  UserCredential? userCredential = await _auth.createUserWithEmailAndPassword(
                    email: email,
                    password: password,
                  );

                  if (userCredential != null && userCredential.user != null) {
                    // Create a new user document with the user's data, including the plain text password, in Firestore.
                    await _usersCollection.doc(userCredential.user!.uid).set({
                      'name': name,
                      'email': email,
                      'address': address,
                      'password': password, // Store plain text password
                    });

                    // Clear the text controllers.
                    nameController.clear();
                    emailController.clear();
                    passwordController.clear();
                    addressController.clear();

                    // Reset the error message.
                    setState(() {
                      _errorText = null;
                    });

                    // Optionally, you can navigate to another page or show a success message.
                  } else {
                    // Handle registration failure and show an error message.
                    setState(() {
                      _errorText = 'Registration failed. Please try again.';
                    });
                  }
                } catch (e) {
                  // Handle errors (e.g., email already in use) appropriately.
                  setState(() {
                    _errorText = 'Error: $e';
                  });
                }
              },
              child: Text('Create Account'),
            ),
          ],
        ),
      ),
    );
  }
}
