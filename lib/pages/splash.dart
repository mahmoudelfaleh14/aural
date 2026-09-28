import 'dart:math' as math;

import 'package:aural/constants/colors.dart';
import 'package:aural/pages/home_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _waveController;

  @override
  void initState() {
    super.initState();


    _waveController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    )..repeat();

    Future.delayed(const Duration(seconds: 5), () {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
  }

  @override
  void dispose() {
    _waveController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pcolor,
      body: Center(
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0.7, end: 1),
          duration: const Duration(milliseconds: 1200),
          curve: Curves.easeOutBack,
          builder: (context, value, child) {
            return Opacity(
              opacity: value.clamp(0.0, 1.0),
              child: Transform.scale(scale: value, child: child),
            );
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
           
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white24, width: 1),
                ),
                child: const Icon(
                  Icons.headphones_rounded,
                  color: Colors.white,
                  size: 30,
                ),
              ),

              const SizedBox(height: 24),

              const Text(
                'A U R A L',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 7,
                ),
              ),

              const SizedBox(height: 14),

       
              const Text(
                'PURE SOUND. PURE FOCUS.',
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 9,
                  letterSpacing: 2.5,
                ),
              ),

              const SizedBox(height: 28),

            
              AnimatedBuilder(
                animation: _waveController,
                builder: (context, child) {
                  final value = _waveController.value;

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _soundBar(18 + math.sin(value * math.pi * 2) * 7),

                      const SizedBox(width: 4),

                      _soundBar(
                        30 + math.sin((value * math.pi * 2) + 0.8) * 10,
                      ),

                      const SizedBox(width: 4),

                      _soundBar(
                        42 + math.sin((value * math.pi * 2) + 1.6) * 13,
                      ),

                      const SizedBox(width: 4),

                      _soundBar(
                        30 + math.sin((value * math.pi * 2) + 2.4) * 10,
                      ),

                      const SizedBox(width: 4),

                      _soundBar(18 + math.sin((value * math.pi * 2) + 3.2) * 7),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _soundBar(double height) {
    return Container(
      width: 4,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
