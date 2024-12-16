import 'package:flutter/material.dart';
import 'package:major_app/screens/optional_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OptionalPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade600,
      body: Stack(
        children: [
          Column(
            children: [
              // Image Section
              Container(
                height: 275,
                width: 330,
                margin: const EdgeInsets.only(top: 100, left: 34),
                child: const Center(
                  child: Image(
                    image: AssetImage('assets/15268948.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 140,
              ),
              // Title Text
              const Text(
                "Diet Planner",
                style: TextStyle(
                  fontFamily:
                      'header', // Ensure you have the font in pubspec.yaml
                  fontSize: 55,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
