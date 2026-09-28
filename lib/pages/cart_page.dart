import 'package:aural/constants/colors.dart';
import 'package:aural/controllers/cart_controller.dart';
import 'package:aural/models/product.dart';
import 'package:aural/widgets/main_app_bar.dart';
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
          ? const _EmptyCart()
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



class CartProductCard extends StatelessWidget {
  final Product product;
  final int quantity;

  const CartProductCard({
    super.key,
    required this.product,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    final cartController = context.read<CartController>();

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFF171817),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
       
          Container(
            width: 110,
            height: 110,
            decoration: BoxDecoration(
              color: const Color(0xFFDED7CF),
              borderRadius: BorderRadius.circular(11),
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(product.productimg, fit: BoxFit.cover),
          ),

          const SizedBox(width: 12),

 
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        product.productname,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    IconButton(
                      onPressed: () {
                        cartController.removeFromCart(product);
                      },
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(
                        minWidth: 28,
                        minHeight: 28,
                      ),
                      icon: const Icon(
                        Icons.delete_outline_rounded,
                        color: Colors.white54,
                        size: 19,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 2),

                Text(
                  product.productdiscription,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white54, fontSize: 11),
                ),

                const SizedBox(height: 8),

                Text(
                  '\$${product.price}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 8),

      
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 34,
                    decoration: BoxDecoration(
                      color: const Color(0xFF252625),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            cartController.decreaseQuantity(product);
                          },
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(
                            minWidth: 34,
                            minHeight: 34,
                          ),
                          icon: const Icon(
                            Icons.remove,
                            color: Colors.white70,
                            size: 15,
                          ),
                        ),

                        Text(
                          '$quantity',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        IconButton(
                          onPressed: () {
                            cartController.increaseQuantity(product);
                          },
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(
                            minWidth: 34,
                            minHeight: 34,
                          ),
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white70,
                            size: 15,
                          ),
                        ),
                      ],
                    ),
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

// =====================================================
// Promo Code
// =====================================================

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
    // =========================
    // Closed
    // =========================
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

    // =========================
    // Open
    // =========================
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

// =====================================================
// Cart Summary
// =====================================================

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
        _SummaryRow(
          title: 'Subtotal',
          value: '\$${subtotal.toStringAsFixed(0)}',
        ),

        const SizedBox(height: 10),

        _SummaryRow(
          title: 'Shipping',
          value: shipping == 0 ? '\$0' : '\$${shipping.toStringAsFixed(0)}',
        ),

        const Padding(
          padding: EdgeInsets.symmetric(vertical: 14),
          child: Divider(color: Colors.white12, height: 1),
        ),

        _SummaryRow(
          title: 'Total',
          value: '\$${total.toStringAsFixed(0)}',
          isTotal: true,
        ),
      ],
    );
  }
}

// =====================================================
// Summary Row
// =====================================================

class _SummaryRow extends StatelessWidget {
  final String title;
  final String value;
  final bool isTotal;

  const _SummaryRow({
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

// =====================================================
// Cart Benefit
// =====================================================

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

// =====================================================
// Empty Cart
// =====================================================

class _EmptyCart extends StatelessWidget {
  const _EmptyCart();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 75,
              height: 75,
              decoration: const BoxDecoration(
                color: Color(0xFF191A19),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.shopping_bag_outlined,
                color: Colors.white54,
                size: 32,
              ),
            ),

            const SizedBox(height: 18),

            const Text(
              'Your cart is empty',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 7),

            const Text(
              'Add some products to your cart',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white54, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
