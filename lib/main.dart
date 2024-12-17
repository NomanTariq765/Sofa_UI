import 'package:flutter/material.dart';
import 'package:sofa_ui/first_screen_ui.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const FirstScreenUi()),
      );
    });

    return Scaffold(
      backgroundColor: Color(0xFFF5F6F8),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/sofa1.png', // Replace with your image file
              width: 200, // Set the desired width
              height: 200, // Set the desired height
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
            const Text(
              'SOFA',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}