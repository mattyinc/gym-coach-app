import 'package:flutter/material.dart';

class OnboardingChartCard extends StatefulWidget {
  const OnboardingChartCard({super.key});

  @override
  State<OnboardingChartCard> createState() => _OnboardingChartCardState();
}

class _OnboardingChartCardState extends State<OnboardingChartCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF1C2E21),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Weekly Activity',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Up 15%',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.monitor_heart_outlined,
                color: Color(0xFFBAFCA2),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Chart
          SizedBox(
            height: 120,
            width: double.infinity,
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, _) {
                return CustomPaint(
                  painter: _ChartPainter(progress: _animation.value),
                );
              },
            ),
          ),

          const SizedBox(height: 8),

          // Days
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              _Day('M'),
              _Day('T'),
              _Day('W'),
              _Day('T'),
              _Day('F'),
              _Day('S'),
              _Day('S'),
            ],
          ),
        ],
      ),
    );
  }
}

class _Day extends StatelessWidget {
  final String label;
  const _Day(this.label);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        color: Colors.white38,
        fontSize: 11,
      ),
    );
  }
}

class _ChartPainter extends CustomPainter {
  final double progress;

  _ChartPainter({required this.progress});

  static const Color accent = Color(0xFFBAFCA2);

  @override
  void paint(Canvas canvas, Size size) {
    final paintLine = Paint()
      ..color = accent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    final paintFill = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          accent.withOpacity(0.25),
          accent.withOpacity(0.0),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final path = Path();

    final points = [
      Offset(0.0, size.height * 0.75),
      Offset(size.width * 0.2, size.height * 0.45),
      Offset(size.width * 0.4, size.height * 0.6),
      Offset(size.width * 0.6, size.height * 0.35),
      Offset(size.width * 0.8, size.height * 0.25),
      Offset(size.width, size.height * 0.15),
    ];

    // Animate path drawing
    final animatedPoints =
    points.take((points.length * progress).ceil()).toList();

    if (animatedPoints.isEmpty) return;

    path.moveTo(animatedPoints.first.dx, animatedPoints.first.dy);

    for (int i = 1; i < animatedPoints.length; i++) {
      path.lineTo(animatedPoints[i].dx, animatedPoints[i].dy);
    }

    // Area fill
    final fillPath = Path.from(path)
      ..lineTo(animatedPoints.last.dx, size.height)
      ..lineTo(animatedPoints.first.dx, size.height)
      ..close();

    canvas.drawPath(fillPath, paintFill);
    canvas.drawPath(path, paintLine);
  }

  @override
  bool shouldRepaint(covariant _ChartPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

class _CaloriePill extends StatelessWidget {
  const _CaloriePill();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFBAFCA2),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFBAFCA2).withOpacity(0.35),
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
