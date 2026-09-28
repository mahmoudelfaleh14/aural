import 'package:aural/controllers/cart_controller.dart';
import 'package:aural/controllers/fav_controller.dart';
import 'package:aural/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoritesController()),
        ChangeNotifierProvider(create: (_) => CartController()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aural',
      theme: ThemeData.dark(useMaterial3: true),
      home: const SplashScreen(),
    );
  }
}
