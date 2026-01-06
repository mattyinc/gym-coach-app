import 'package:flutter/material.dart';
import 'widgets/onboarding_chart_card.dart';

class OnboardingScreen2 extends StatelessWidget {
  final VoidCallback onContinue;
  final VoidCallback onSkip;

  const OnboardingScreen2({
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
              // ── Skip
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

              // ── HERO SECTION (matches Screen 1 height)
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Stack(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(16),
                        child: OnboardingChartCard(),
                      ),

                      // ── Floating Calorie Pill
                      const Positioned(
                        bottom: 35,
                        right: 35,
                        child: _CaloriePill(),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // ── Title
              const Text(
                'Track Your Progress',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              // ── Description
              const Text(
                'Log workouts, monitor performance, and track nutrition with clear, easy-to-read progress charts.',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 15,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 28),

              // ── Page Indicator (2nd active)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _dot(),
                  _dot(active: true),
                  _dot(),
                ],
              ),

              const SizedBox(height: 28),

              // ── Continue Button
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

/* =========================
   FLOATING CALORIE PILL
   ========================= */

class _CaloriePill extends StatelessWidget {
  const _CaloriePill();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF6EF37A),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6EF37A).withOpacity(0.35),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(
            Icons.local_fire_department,
            size: 18,
            color: Color(0xFF142217),
          ),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Calories',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF142217),
                ),
              ),
              Text(
                '1,840 kcal',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF142217),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
