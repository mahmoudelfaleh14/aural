import 'package:flutter/material.dart';

class FeatureTile extends StatelessWidget {
  final IconData icon;
  final String title;

  const FeatureTile({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF121312),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white10),
      ),
      child: ListTile(
        dense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        leading: Icon(icon, color: Colors.white54, size: 18),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white70, fontSize: 12),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.white38,
          size: 13,
        ),
      ),
    );
  }
}
