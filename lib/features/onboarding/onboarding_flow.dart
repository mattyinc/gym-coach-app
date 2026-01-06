import 'package:flutter/material.dart';
import 'onboarding_screen_1.dart';
import '../auth/login_screen.dart';
import 'onboarding_screen_2.dart';
import 'onboarding_screen_3.dart';



class OnboardingFlow extends StatefulWidget {
  const OnboardingFlow({super.key});

  @override
  State<OnboardingFlow> createState() => _OnboardingFlowState();
}

class _OnboardingFlowState extends State<OnboardingFlow> {
  final PageController _pageController = PageController();

  void _goToNextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void _skipToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const BouncingScrollPhysics(),
        children: [
          OnboardingScreen1(
            onContinue: _goToNextPage,
            onSkip: _skipToLogin,
          ),
          OnboardingScreen2(
            onContinue: _goToNextPage,
            onSkip: _skipToLogin,
          ),
          OnboardingScreen3(
            onFinish: _skipToLogin,
            onLogin: _skipToLogin,
          ),
        ],
      ),
    );
  }
}
