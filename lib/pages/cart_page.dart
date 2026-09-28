import 'package:aural/constants/colors.dart';
import 'package:aural/controllers/cart_controller.dart';
import 'package:aural/widgets/cart_benifit.dart';
import 'package:aural/widgets/cart_product_card.dart';
import 'package:aural/widgets/cart_summary.dart';
import 'package:aural/widgets/empty_cart.dart';
import 'package:aural/widgets/main_app_bar.dart';
import 'package:aural/widgets/promocode_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool showPromoField = false;

  final TextEditingController promoController = TextEditingController();

  @override
  void dispose() {
    promoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cartController = context.watch<CartController>();
    final cart = cartController.cart;

    return Scaffold(
      backgroundColor: pcolor,

      appBar: MainAppBar(
        showCart: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 19,
          ),
        ),
      ),

      body: cart.isEmpty
          ? const EmptyCart()
          : SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 30),
              child: Column(
                children: [
                  ...cart.entries.map((entry) {
                    return CartProductCard(
                      product: entry.key,
                      quantity: entry.value,
                    );
                  }),

                  const SizedBox(height: 12),

                  PromoCodeBox(
                    controller: promoController,
                    isOpen: showPromoField,
                    onTap: () {
                      setState(() {
                        showPromoField = !showPromoField;
                      });
                    },
                    onApply: () {
                      final code = promoController.text.trim();

                      if (code.isEmpty) {
                        return;
                      }

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Promo code "$code" applied')),
                      );
                    },
                  ),

                  const SizedBox(height: 18),

                  CartSummary(
                    subtotal: cartController.subtotal,
                    shipping: cartController.shipping,
                    total: cartController.total,
                  ),

                  const SizedBox(height: 18),

                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFEDE4D8),
                        foregroundColor: const Color(0xFF0D0E0D),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Checkout',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.arrow_forward_rounded, size: 18),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),

                  const Row(
                    children: [
                      Expanded(
                        child: CartBenefit(
                          icon: Icons.local_shipping_outlined,
                          title: 'Free Shipping',
                          subtitle: 'Over \$100',
                        ),
                      ),
                      Expanded(
                        child: CartBenefit(
                          icon: Icons.access_time_rounded,
                          title: '30-Day',
                          subtitle: 'Returns',
                        ),
                      ),
                      Expanded(
                        child: CartBenefit(
                          icon: Icons.verified_outlined,
                          title: '2-Year',
                          subtitle: 'Warranty',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}

