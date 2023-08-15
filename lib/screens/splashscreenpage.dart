import 'package:flutter/material.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set your desired background color
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60.0),
          child: Image.asset('images/stopwatchlogo.PNG'),
        ), // Load the image
      ),
    );
  }
}
