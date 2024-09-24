import 'package:chat_app/helper/api.dart';
import 'package:chat_app/models/products.dart';

class GetCategory {
  Future<List<dynamic>> getCategory({required String categoryName}) async {
    List<dynamic> jsonData = await Api()
        .get(url: "https://fakestoreapi.com/products/category/$categoryName");
    List<Product> categorylist = [];
    for (int i = 0; i < categorylist.length; i++) {
      categorylist.add(Product.fromJson(jsonData[i]));
    }
    return categorylist;
  }
}
