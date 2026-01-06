import 'package:flutter/material.dart';
import '../../core/utils/greeting_utils.dart';

class CoachHomeScreen extends StatelessWidget {
  const CoachHomeScreen({super.key});

  static const Color _bgColor = Color(0xFF142217);
  static const Color _accentGreen = Color(0xFF6EF37A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              _Header(),
              SizedBox(height: 24),
              _StatsRow(),
              SizedBox(height: 24),
              _SearchBar(),
              SizedBox(height: 16),
              _FilterChips(),
            ],
          ),
        ),
      ),
    );
  }
}

/* =========================
   HEADER
   ========================= */

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            const ColorFiltered(
              colorFilter: ColorFilter.matrix(<double>[
                0.2126, 0.7152, 0.0722, 0, 0,
                0.2126, 0.7152, 0.0722, 0, 0,
                0.2126, 0.7152, 0.0722, 0, 0,
                0,      0,      0,      1, 0,
              ]),
              child: CircleAvatar(
                radius: 26,
                backgroundImage: AssetImage('assets/images/coach.png'),
                backgroundColor: Colors.black26,
              ),
            ),
            Positioned(
              bottom: 2,
              right: 2,
              child: Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${getGreeting()},',
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Coach Alexis',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_none,
            color: Colors.white,
            size: 26,
          ),
        ),
      ],
    );
  }
}

/* =========================
   STATS ROW
   ========================= */

class _StatsRow extends StatelessWidget {
  const _StatsRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        _StatCard(
          title: 'CLIENTS',
          value: '32',
        ),
        SizedBox(width: 12),
        _StatCard(
          title: 'ACTIVE',
          value: '15',
        ),
        SizedBox(width: 12),
        _StatCard(
          title: 'ALERTS',
          value: '4',
          highlighted: true,
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final bool highlighted;

  const _StatCard({
    required this.title,
    required this.value,
    this.highlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: highlighted
              ? CoachHomeScreen._accentGreen
              : Colors.white.withOpacity(0.08),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: highlighted ? Colors.black : Colors.white70,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                color: highlighted ? Colors.black : Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* =========================
   SEARCH BAR
   ========================= */

class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(14),
      ),
      child: const TextField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          icon: Icon(Icons.search, color: Colors.white70),
          hintText: 'Search clients...',
          hintStyle: TextStyle(color: Colors.white70),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

/* =========================
   FILTER CHIPS
   ========================= */

class _FilterChips extends StatelessWidget {
  const _FilterChips();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        _FilterChip(label: 'All', selected: true),
        SizedBox(width: 8),
        _FilterChip(label: 'Active'),
        SizedBox(width: 8),
        _FilterChip(label: 'Pending'),
        SizedBox(width: 8),
        _FilterChip(label: 'Inactive'),
      ],
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool selected;

  const _FilterChip({
    required this.label,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: selected
            ? CoachHomeScreen._accentGreen
            : Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: selected ? Colors.black : Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
