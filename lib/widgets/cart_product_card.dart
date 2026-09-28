import 'package:aural/controllers/cart_controller.dart';
import 'package:aural/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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



