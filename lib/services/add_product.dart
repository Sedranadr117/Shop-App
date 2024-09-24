import 'package:chat_app/helper/api.dart';
import 'package:chat_app/models/products.dart';

class AddProduct {
  Future<Product> postAddProduct(
      {required String title,
      required String price,
      required String description,
      required String image,
      required String category}) async {
    Map<String, dynamic> jsonData = await Api().post(
      url: "https://fakestoreapi.com/products",
      body: {
        "title": title,
        "price": price,
        "description": description,
        "image": image,
        "category": category
      },
    );
    return Product.fromJson(jsonData);
  }
}
