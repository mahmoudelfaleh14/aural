import 'package:aural/constants/colors.dart';
import 'package:aural/models/products.dart';
import 'package:aural/widgets/main_app_bar.dart';
import 'package:aural/widgets/product_card.dart';
import 'package:flutter/material.dart';

class CollectionPage extends StatefulWidget {
  const CollectionPage({super.key});

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  int selectedCategory = 0;

  final List<String> categories = [
    'All',
    'Over-Ear',
    'Earbuds',
    'On-Ear',
    'Wireless',
  ];

  List<dynamic> get filteredProducts {
    if (selectedCategory == 0) {
      return products;
    }

    final category = categories[selectedCategory];

    return products.where((product) {
      final description = product.productdiscription.toLowerCase();

      switch (category) {
        case 'Over-Ear':
          return description.contains('over-ear');

        case 'Earbuds':
          return description.contains('earbuds') ||
              description.contains('true wireless') ||
              description.contains('open-ear');

        case 'On-Ear':
          return description.contains('on-ear');

        case 'Wireless':
          return description.contains('wireless');

        default:
          return true;
      }
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pcolor,

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

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // =========================
              // Page Title
              // =========================
              const Text(
                'Explore Collection',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Georgia',
                ),
              ),

              const SizedBox(height: 4),

              const Text(
                'Find your sound.',
                style: TextStyle(color: Colors.white54, fontSize: 15),
              ),

              const SizedBox(height: 22),

              // =========================
              // Categories + Sort
              // =========================
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 44,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        separatorBuilder: (_, __) => const SizedBox(width: 8),
                        itemBuilder: (context, index) {
                          final isSelected = selectedCategory == index;

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedCategory = index;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? const Color(0xFFEDE4D8)
                                    : const Color(0xFF151615),
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                  color: isSelected
                                      ? Colors.transparent
                                      : Colors.white10,
                                ),
                              ),
                              child: Text(
                                categories[index],
                                style: TextStyle(
                                  color: isSelected
                                      ? const Color(0xFF0D0E0D)
                                      : Colors.white70,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  Container(
                    height: 44,
                    width: 44,
                    decoration: BoxDecoration(
                      color: const Color(0xFF151615),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: Colors.white10),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.tune,
                        size: 20,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // =========================
              // Products Count
              // =========================
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'All Products',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  Text(
                    '${filteredProducts.length} items',
                    style: const TextStyle(color: Colors.white38, fontSize: 11),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // =========================
              // Products Grid
              // =========================
              GridView.builder(
                itemCount: filteredProducts.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),

                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.48,
                ),

                itemBuilder: (context, index) {
                  final product = filteredProducts[index];

                  return ProductCard(product: product);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
