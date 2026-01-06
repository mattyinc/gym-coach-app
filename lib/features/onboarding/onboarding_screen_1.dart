import 'package:flutter/material.dart';

class OnboardingScreen1 extends StatelessWidget {
  final VoidCallback onContinue;
  final VoidCallback onSkip;

  const OnboardingScreen1({
    super.key,
    required this.onContinue,
    required this.onSkip,
  });

  static const Color bgColor = Color(0xFF142217);
  static const Color accentGreen = Color(0xFF6EF37A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Skip button
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: onSkip,
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // ── Image card
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: bgColor, // base color for blend
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(28),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        // ── Base image
                        Image.asset(
                          'assets/images/onboarding_1.png',
                          fit: BoxFit.cover,
                        ),

                        // ── Blend overlay (THIS is the key)
                        Container(
                          color: bgColor.withOpacity(0.7),
                          child: const SizedBox.expand(),
                        ),

                        // ── Soft gradient for readability
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.7),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // ── Title
              const Text(
                'Personal Coaching',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              // ── Description
              const Text(
                'Experience expert 1-on-1 guidance designed specifically for your body and your goals. No more guessing.',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 15,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 28),

              // ── Page indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _dot(active: true),
                  _dot(),
                  _dot(),
                ],
              ),

              const SizedBox(height: 28),

              // ── Continue button
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: onContinue,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Continue',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ── Page indicator dot
  static Widget _dot({bool active = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: active ? 18 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: active ? accentGreen : Colors.white24,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
