import 'dart:async';
import 'package:flutter/material.dart';
import '../coach/coach_home_screen.dart';
import '../client/client_home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _decideNextScreen();
  }

  void _decideNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));

    // TEMP logic — we will replace this with Firebase
    final String role = 'client'; // change to 'client' to test

    if (!mounted) return;

    if (role == 'coach') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const CoachHomeScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const ClientHomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Gym Coach',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
