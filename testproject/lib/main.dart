import 'package:flutter/material.dart';
import 'page1.dart'; // Import the first page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Page1(), // Start the app with Page1
    );
  }
}
