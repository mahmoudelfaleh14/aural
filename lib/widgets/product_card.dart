import 'package:aural/controllers/fav_controller.dart';
import 'package:aural/models/product.dart';
import 'package:aural/pages/product_details_page.dart';
import 'package:aural/constants/add_to_cart_btn.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final favoritesController = Provider.of<FavoritesController>(context);

    final isFavorite = favoritesController.isFavorite(product);

    return InkWell(
      borderRadius: BorderRadius.circular(18),

      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsPage(
              productimg: product.productimg,
              productname: product.productname,
              productdiscription: product.productdiscription,
              price: product.price,
              longDescription: product.longDescription,
            ),
          ),
        );
      },

      child: Container(
        width: double.infinity,

        decoration: BoxDecoration(
          color: const Color(0xFF151615),
          borderRadius: BorderRadius.circular(18),
        ),

        clipBehavior: Clip.antiAlias,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,

          children: [
            AspectRatio(
              aspectRatio: 1122 / 1402,

              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      product.productimg,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                  ),

                  Positioned(
                    top: 8,
                    right: 8,

                    child: Container(
                      width: 32,
                      height: 32,

                      decoration: const BoxDecoration(
                        color: Color(0x990D0E0D),
                        shape: BoxShape.circle,
                      ),

                      child: IconButton(
                        padding: EdgeInsets.zero,

                        onPressed: () {
                          favoritesController.toggleFavorite(product);
                        },

                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,

                          size: 17,

                          color: isFavorite
                              ? const Color.fromARGB(255, 255, 255, 255)
                              : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,

                children: [
                  Text(
                    product.productname,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,

                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    product.productdiscription,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,

                    style: const TextStyle(color: Colors.white54, fontSize: 11),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    '${product.price}\$',

                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 10),
                  AddToCartBtn(product: product),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
