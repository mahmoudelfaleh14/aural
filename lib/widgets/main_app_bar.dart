import 'package:aural/constants/colors.dart';
import 'package:aural/controllers/cart_controller.dart';
import 'package:aural/pages/cart_page.dart';
import 'package:aural/pages/fav_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final List<Widget>? actions;
  final Color? backgroundColor;

  final bool showCart;
  final bool showFav;

  const MainAppBar({
    super.key,
    this.leading,
    this.actions,
    this.backgroundColor,
    this.showCart = true,
    this.showFav = true,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final cartItems = context.watch<CartController>().totalItems;

    return AppBar(
      backgroundColor: backgroundColor ?? pcolor,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,

      // Leading
      leading: leading,

      // Title
      title: const Text(
        'A U R A L',
        style: TextStyle(
          letterSpacing: 6,
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
      ),

      actions: [
        ...?actions,

        // Favorite
        if (showFav)
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FavoritesPage(),
                ),
              );
            },
            icon: const Icon(
              Icons.favorite_border,
              color: Colors.white,
            ),
          ),

        // Cart
        if (showCart)
          Stack(
            clipBehavior: Clip.none,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartPage(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.white,
                ),
              ),

              if (cartItems > 0)
                Positioned(
                  right: 4,
                  top: 2,
                  child: Container(
                    width: 17,
                    height: 17,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '$cartItems',
                      style: const TextStyle(
                        color: Color(0xFF0D0E0D),
                        fontSize: 9,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
            ],
          ),
      ],
    );
  }
}