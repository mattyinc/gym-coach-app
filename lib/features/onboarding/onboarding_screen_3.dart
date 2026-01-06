import 'dart:ui';
import 'package:flutter/material.dart';

class OnboardingScreen3 extends StatelessWidget {
  final VoidCallback onFinish;
  final VoidCallback onLogin;

  const OnboardingScreen3({
    super.key,
    required this.onFinish,
    required this.onLogin,
  });

  static const Color bgColor = Color(0xFF142217);
  static const Color accentGreen = Color(0xFFBAFCA2);
  static const Color mutedText = Color(0xFFA0B0A5);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // ───────────────── IMAGE SECTION (70%)
            Stack(
              children: [
                SizedBox(
                  height: height * 0.55,
                  width: double.infinity,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        'assets/images/onboarding_3.png',
                        fit: BoxFit.cover,
                        alignment: const Alignment(0, -0.1),
                      ),

                      // Dark tint
                      Container(
                        color: bgColor.withOpacity(0.35),
                      ),

                      // Bottom fade
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 160,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                bgColor.withOpacity(0.0),
                                bgColor,
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // ── Glass Skip Button
                Positioned(
                  top: 16,
                  right: 16,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                      child: GestureDetector(
                        onTap: onLogin,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.25),
                            ),
                          ),
                          child: const Text(
                            'Skip',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // ───────────────── CONTENT SECTION
            Expanded(
              child: Container(
                width: double.infinity,
                color: bgColor,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(24, 20, 24, 28),
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      // Page indicator
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _dot(),
                          _dot(),
                          _dot(active: true),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // Title
                      const Text(
                        "Let’s Get Started",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Description
                      const Text(
                        'Your journey to a stronger, healthier you begins now. '
                            'Join our community to track progress and crush goals.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: mutedText,
                          fontSize: 16,
                          height: 1.5,
                        ),
                      ),

                      const SizedBox(height: 28),

                      // Primary CTA
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: onFinish,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: accentGreen,
                            foregroundColor: bgColor,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Get Started',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(Icons.arrow_forward),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 14),

                      // Secondary CTA
                      TextButton(
                        onPressed: onLogin,
                        child: const Text(
                          'I already have an account',
                          style: TextStyle(
                            color: mutedText,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _dot({bool active = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: active ? 24 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: active ? accentGreen : const Color(0xFF2A3B2E),
        borderRadius: BorderRadius.circular(20),
        boxShadow: active
            ? [
          BoxShadow(
            color: accentGreen.withOpacity(0.35),
            blurRadius: 10,
          )
        ]
            : null,
      ),
    );
  }
}
