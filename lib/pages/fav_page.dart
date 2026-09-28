import 'package:aural/constants/colors.dart';
import 'package:aural/controllers/fav_controller.dart';
import 'package:aural/widgets/fav_product_card.dart';
import 'package:aural/widgets/main_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = context.watch<FavoritesController>().favorites;

    return Scaffold(
      backgroundColor: pcolor,

    
      appBar: MainAppBar(
        showCart: true,
        showFav: false,
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 24),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
           
            const Text(
              'Your Favorites',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.w500,
                fontFamily: 'Georgia',
              ),
            ),

            const SizedBox(height: 5),

            Row(
              children: [
                const Expanded(
                  child: Text(
                    'The sound you love, all in one place.',
                    style: TextStyle(color: Colors.white54, fontSize: 14),
                  ),
                ),

                Text(
                  '${favorites.length} Items',
                  style: const TextStyle(color: Colors.white70, fontSize: 13),
                ),

                const SizedBox(width: 10),

                OutlinedButton(
                  onPressed: () {
                  },

                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: Colors.white30),

                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 9,
                    ),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),

                  child: const Text('Edit', style: TextStyle(fontSize: 12)),
                ),
              ],
            ),

            const SizedBox(height: 20),

            
            if (favorites.isEmpty)
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 80),

                  child: Column(
                    children: [
                      Icon(
                        Icons.favorite_border,
                        size: 60,
                        color: Colors.white38,
                      ),

                      SizedBox(height: 15),

                      Text(
                        'No favorites yet',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      SizedBox(height: 6),

                      Text(
                        'Add products to your favorites',
                        style: TextStyle(color: Colors.white54, fontSize: 13),
                      ),
                    ],
                  ),
                ),
              )
            else
              GridView.builder(
                itemCount: favorites.length,

                shrinkWrap: true,

                physics: const NeverScrollableScrollPhysics(),

                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,

                  childAspectRatio: 0.65,
                ),

                itemBuilder: (context, index) {
                  final product = favorites[index];

                  return FavoriteProductCard(product: product);
                },
              ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
