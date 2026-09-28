// ignore_for_file: deprecated_member_use

import 'package:aural/pages/collection_page.dart';
import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 2),

      clipBehavior: Clip.antiAlias,

      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),

      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/01_AURAL_Hero.png',
              fit: BoxFit.cover,
            ),
          ),

          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.black.withOpacity(0.75),
                    Colors.black.withOpacity(0.25),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            left: 20,
            top: 65,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'NEW DROP',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    letterSpacing: 1.2,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Feel\nevery\n detail.',
                  style: TextStyle(
                    fontFamily: 'Georgia',
                    color: Colors.white,
                    fontSize: 38,
                    height: 0.96,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 12),

                const Text(
                  'Premium sound\nfor a more focused you.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    height: 1.3,
                  ),
                ),

                const SizedBox(height: 16),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CollectionPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF0D0E0D),
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Explore Collection',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      SizedBox(width: 8),

                      Icon(Icons.arrow_forward_rounded, size: 18),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
