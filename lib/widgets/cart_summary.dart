import 'package:aural/widgets/summary_row.dart';
import 'package:flutter/material.dart';

class CartSummary extends StatelessWidget {
  final double subtotal;
  final double shipping;
  final double total;

  const CartSummary({
    super.key,
    required this.subtotal,
    required this.shipping,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SummaryRow(
          title: 'Subtotal',
          value: '\$${subtotal.toStringAsFixed(0)}',
        ),

        const SizedBox(height: 10),

        SummaryRow(
          title: 'Shipping',
          value: shipping == 0 ? '\$0' : '\$${shipping.toStringAsFixed(0)}',
        ),

        const Padding(
          padding: EdgeInsets.symmetric(vertical: 14),
          child: Divider(color: Colors.white12, height: 1),
        ),

        SummaryRow(
          title: 'Total',
          value: '\$${total.toStringAsFixed(0)}',
          isTotal: true,
        ),
      ],
    );
  }
}






