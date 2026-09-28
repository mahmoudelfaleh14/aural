import 'package:aural/pages/cart_page.dart';
import 'package:aural/pages/collection_page.dart';
import 'package:aural/pages/fav_page.dart';
import 'package:aural/widgets/drawer_item.dart';
import 'package:flutter/material.dart';

class AuralDrawer extends StatelessWidget {
  const AuralDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF0D0E0D),
      width: MediaQuery.of(context).size.width * 0.78,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 20, 28),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'A U R A L',
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 6,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white54,
                      size: 21,
                    ),
                  ),
                ],
              ),
            ),

           
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Divider(color: Colors.white10, height: 1),
            ),

            const SizedBox(height: 20),

      
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'MENU',
                style: TextStyle(
                  color: Colors.white38,
                  fontSize: 10,
                  letterSpacing: 2,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            const SizedBox(height: 10),

        
            DrawerItem(
              icon: Icons.home_outlined,
              title: 'Home',
              onTap: () {
                Navigator.pop(context);
              },
            ),

          
            DrawerItem(
              icon: Icons.grid_view_rounded,
              title: 'Collection',
              onTap: () {
                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CollectionPage(),
                  ),
                );
              },
            ),

         
            DrawerItem(
              icon: Icons.favorite_border,
              title: 'Favorites',
              onTap: () {
                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FavoritesPage(),
                  ),
                );
              },
            ),

        
            DrawerItem(
              icon: Icons.shopping_bag_outlined,
              title: 'Cart',
              onTap: () {
                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CartPage()),
                );
              },
            ),

            const Spacer(),

     
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF151615),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.headphones_outlined,
                      color: Colors.white70,
                      size: 20,
                    ),

                    SizedBox(width: 12),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'AURAL',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          SizedBox(height: 3),

                          Text(
                            'Pure sound. Pure focus.',
                            style: TextStyle(
                              color: Colors.white38,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
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

