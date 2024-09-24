import 'package:chat_app/models/products.dart';
import 'package:chat_app/services/all_product.dart';
import 'package:chat_app/widget/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff9DB0CE),
          elevation: 5,
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.cartShopping),
              color: Colors.black,
            )
          ],
          title: const Text(
            "New Trend",
            style: TextStyle(
                fontSize: 25,
                //fontFamily: "Pacifico",
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.only(top: 55, left: 9, right: 9),
            child: FutureBuilder<List<Product>>(
                future: AllProduct().getAllProduct(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Product> products = snapshot.data!;
                    return GridView.builder(
                        itemCount: products.length,
                        clipBehavior: Clip.none,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.4,
                          mainAxisSpacing: 45,
                          crossAxisSpacing: 10,
                        ),
                        itemBuilder: ((context, index) {
                          return CustomCard(
                            product: products[index],
                          );
                        }));
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                })));
  }
}
