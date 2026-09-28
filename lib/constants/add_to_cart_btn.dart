import 'package:aural/controllers/cart_controller.dart';
import 'package:aural/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddToCartBtn extends StatelessWidget {
  final Product product;

  const AddToCartBtn({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 38,
      child: ElevatedButton(
        onPressed: () {
          context.read<CartController>().addToCart(product);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: const Color(0xFF0D0E0D),
          elevation: 0,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          'Add to Cart',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}