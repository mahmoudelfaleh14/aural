import 'package:aural/constants/add_to_cart_btn.dart';
import 'package:aural/controllers/fav_controller.dart';
import 'package:aural/widgets/feature_item.dart';
import 'package:aural/widgets/feature_tile.dart';
import 'package:aural/widgets/main_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:aural/models/products.dart';
import 'package:provider/provider.dart';

class ProductDetailsPage extends StatelessWidget {
  final String productimg;
  final String productname;
  final String productdiscription;
  final String price;
  final String longDescription;

  const ProductDetailsPage({
    super.key,
    required this.productimg,
    required this.productname,
    required this.productdiscription,
    required this.price,
    required this.longDescription,
  });

  @override
  Widget build(BuildContext context) {
  
    final product = products.firstWhere(
      (item) => item.productname == productname,
    );

    final isFavorite = context.watch<FavoritesController>().isFavorite(product);

    return Scaffold(
      backgroundColor: const Color(0xFF0D0E0D),

      
      appBar: MainAppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),

  
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
          child: SizedBox(
            height: 52,
            width: double.infinity,
            child: AddToCartBtn(product: product),
          ),
        ),
      ),

      body: SafeArea(
        child: CustomScrollView(
          slivers: [
          
            SliverToBoxAdapter(
              child: AspectRatio(
                aspectRatio: 1122 / 1420,
                child: Image.asset(
                  productimg,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
            ),

        
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 18, 16, 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            productname,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                        const SizedBox(width: 8),

                        IconButton(
                          onPressed: () {
                            context.read<FavoritesController>().toggleFavorite(
                              product,
                            );
                          },
                          icon: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 5),

                  
                    Text(
                      productdiscription,
                      style: const TextStyle(
                        color: Colors.white54,
                        fontSize: 13,
                      ),
                    ),

                    const SizedBox(height: 10),

              
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '$price\$',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 21,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        const Spacer(),

                        const Icon(
                          Icons.star_rounded,
                          color: Color(0xFFD9A441),
                          size: 19,
                        ),

                        const SizedBox(width: 4),

                        const Text(
                          '4.8',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        const SizedBox(width: 4),

                        const Text(
                          '(320 reviews)',
                          style: TextStyle(color: Colors.white54, fontSize: 11),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                   
                    Text(
                      longDescription,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                        height: 1.55,
                      ),
                    ),

                    const SizedBox(height: 24),

                 
                    Row(
                      children: [
                        Expanded(
                          child: FeatureItem(
                            icon: Icons.graphic_eq_rounded,
                            title: 'Active Noise',
                            subtitle: 'Cancellation',
                          ),
                        ),

                        Expanded(
                          child: FeatureItem(
                            icon: Icons.battery_full_rounded,
                            title: 'Up to 30h',
                            subtitle: 'Battery Life',
                          ),
                        ),

                        Expanded(
                          child: FeatureItem(
                            icon: Icons.favorite_outline_rounded,
                            title: 'Premium',
                            subtitle: 'Comfort',
                          ),
                        ),

                        Expanded(
                          child: FeatureItem(
                            icon: Icons.headphones_rounded,
                            title: 'Hi-Res',
                            subtitle: 'Audio',
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 28),

                  
                    const Text(
                      'Features',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 10),

                   
                    const FeatureTile(
                      icon: Icons.graphic_eq_outlined,
                      title: 'Sound',
                    ),

                    const FeatureTile(
                      icon: Icons.battery_5_bar_outlined,
                      title: 'Battery',
                    ),

                    const FeatureTile(
                      icon: Icons.design_services_outlined,
                      title: 'Design',
                    ),

                    const FeatureTile(
                      icon: Icons.inventory_2_outlined,
                      title: 'In the Box',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

