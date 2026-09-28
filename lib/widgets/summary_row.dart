import 'package:flutter/material.dart';

class SummaryRow extends StatelessWidget {
  final String title;
  final String value;
  final bool isTotal;

  const SummaryRow({
    required this.title,
    required this.value,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            color: isTotal ? Colors.white : Colors.white54,
            fontSize: isTotal ? 16 : 13,
            fontWeight: isTotal ? FontWeight.w600 : FontWeight.w400,
          ),
        ),

        const Spacer(),

        Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontSize: isTotal ? 17 : 13,
            fontWeight: isTotal ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ],
    );
  }
}