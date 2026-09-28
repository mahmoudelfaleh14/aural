import 'package:flutter/material.dart';

class PromoCodeBox extends StatelessWidget {
  final TextEditingController controller;
  final bool isOpen;
  final VoidCallback onTap;
  final VoidCallback onApply;

  const PromoCodeBox({
    super.key,
    required this.controller,
    required this.isOpen,
    required this.onTap,
    required this.onApply,
  });

  @override
  Widget build(BuildContext context) {
   
    if (!isOpen) {
      return InkWell(
        borderRadius: BorderRadius.circular(13),
        onTap: onTap,
        child: Container(
          height: 52,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            color: const Color(0xFF1A1B1A),
            borderRadius: BorderRadius.circular(13),
            border: Border.all(color: Colors.white10),
          ),
          child: const Row(
            children: [
              Icon(Icons.sell_outlined, color: Colors.white70, size: 19),

              SizedBox(width: 12),

              Expanded(
                child: Text(
                  'Add promo code',
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                ),
              ),

              Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white54,
                size: 14,
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1B1A),
        borderRadius: BorderRadius.circular(13),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              autofocus: true,
              style: const TextStyle(color: Colors.white, fontSize: 13),
              decoration: InputDecoration(
                hintText: 'Enter promo code',
                hintStyle: const TextStyle(color: Colors.white38, fontSize: 13),
                prefixIcon: const Icon(
                  Icons.sell_outlined,
                  color: Colors.white54,
                  size: 19,
                ),
                filled: true,
                fillColor: const Color(0xFF252625),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          const SizedBox(width: 8),

          SizedBox(
            height: 45,
            child: ElevatedButton(
              onPressed: onApply,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFEDE4D8),
                foregroundColor: const Color(0xFF0D0E0D),
                elevation: 0,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Apply',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



