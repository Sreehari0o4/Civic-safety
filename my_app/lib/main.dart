import 'package:flutter/material.dart';
import 'sign_in_page.dart'; // Import the Sign In Page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignInPage(), // Set SignInPage as the home
    );
  }
}