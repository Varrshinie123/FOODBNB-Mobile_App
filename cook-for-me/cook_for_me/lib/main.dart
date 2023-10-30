import 'package:flutter/material.dart';
import 'package:cook_for_me/pages/MealListingsPage.dart';
import 'package:cook_for_me/pages/LoginPage.dart';
import 'package:cook_for_me/pages/CreateAccountPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:cook_for_me/pages/user_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginStatusProvider()),
        ChangeNotifierProvider(create: (_) => UserDataProvider()), 
        // Provide UserDataProvider
        // Add other providers if needed
      ],
      child: MyApp(), // Your root widget
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foodbnb',
      theme: ThemeData(
        primaryColor: Colors.orange,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginStatusProvider = context.watch<LoginStatusProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Foodbnb'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 102, 0),
      ),
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Welcome to Foodbnb',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Get yourself invited to delicious meals at different homes and savor the varied dining experience. It\'s not just a meal, it\'s an experience',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 32),
                if (loginStatusProvider.isLoggedIn)
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MealListingsPage(),
                        ),
                      );
                    },
                    child: Text('Browse Homes'),
                    style: ElevatedButton.styleFrom(primary: Colors.black),
                  ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to LoginPage as Guest
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(loginAsHost: false),
                          ),
                        ).then((result) {
                          loginStatusProvider.setLoggedIn(result ?? false, 'Guest');
                        });
                      },
                      child: Text('Login as Guest'),
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 208, 255, 0),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to LoginPage as Host
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(loginAsHost: true),
                          ),
                        ).then((result) {
                          loginStatusProvider.setLoggedIn(result ?? false, 'Host');
                        });
                      },
                      child: Text('Login as Host'),
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 208, 255, 0),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to CreateAccountPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateAccountPage(),
                      ),
                    );
                  },
                  child: Text('Create Account'),
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 208, 255, 0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class LoginStatusProvider extends ChangeNotifier {
  bool _isLoggedIn = false;
  String _loginType = '';
  String _userName = ''; // Add user's name property

  bool get isLoggedIn => _isLoggedIn;
  String get loginType => _loginType;
  String get userName => _userName; // Add getter for user's name

  void setLoggedIn(bool status, String type) {
    _isLoggedIn = status;
    _loginType = type;
    notifyListeners();
  }

  void setUserName(String name) {
    _userName = name; // Add setter for user's name
    notifyListeners();
  }
}
