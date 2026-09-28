import 'package:aural/controllers/fav_controller.dart';
import 'package:aural/models/product.dart';
import 'package:aural/pages/product_details_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteProductCard extends StatelessWidget {
  final Product product;

  const FavoriteProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final isFavorite =
        context.watch<FavoritesController>().isFavorite(product);

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF151615),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.white12,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
    
          Expanded(
            flex: 6,
            child: Stack(
              children: [
                Positioned.fill(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailsPage(
                            productimg: product.productimg,
                            productname: product.productname,
                            productdiscription:
                                product.productdiscription,
                            price: product.price,
                            longDescription:
                                product.longDescription,
                          ),
                        ),
                      );
                    },
                    child: Image.asset(
                      product.productimg,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

             
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Color(0x990D0E0D),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      splashRadius: 22,
                      onPressed: () {
                        context
                            .read<FavoritesController>()
                            .toggleFavorite(product);
                      },
                      icon: Icon(
                        isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

         
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                12,
                10,
                10,
                8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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

                  const SizedBox(height: 5),

                  Text(
                    product.productdiscription,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white54,
                      fontSize: 11,
                    ),
                  ),

                  const Spacer(),

                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${product.price}\$',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.white70,
                        size: 16,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}