import 'package:chat_app/screens/home_page.dart';
import 'package:chat_app/screens/update_product_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ShopApp());
}

class ShopApp extends StatelessWidget {
  const ShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "HomePage": (context) => const HomePage(),
        "UpdateProductPage": (context) => UpdateProductPage(),
      },
      initialRoute: "HomePage",
    );
  }
}
