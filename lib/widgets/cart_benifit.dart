import 'package:flutter/material.dart';

class CartBenefit extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const CartBenefit({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: const BoxDecoration(
            color: Color(0xFF1A1B1A),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.white70, size: 19),
        ),

        const SizedBox(height: 8),

        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ),

        const SizedBox(height: 3),

        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white38, fontSize: 9),
        ),
      ],
    );
  }
}



