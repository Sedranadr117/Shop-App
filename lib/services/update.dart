import 'package:chat_app/helper/api.dart';
import 'package:chat_app/models/products.dart';

class UpdateProduct {
  Future<Product> putUpdateProduct(
      {required dynamic id,
      required String title,
      required dynamic price,
      required String description,
      required String image,
      required String category}) async {
    Map<String, dynamic> jsonData = await Api().put(
      url: "https://fakestoreapi.com/products/$id",
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
