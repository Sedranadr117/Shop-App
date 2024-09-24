import 'package:chat_app/helper/api.dart';

class AllCategory {
  Future<List<dynamic>> getAllCategory() async {
    List<dynamic> jsonData =
        await Api().get(url: "https://fakestoreapi.com/products/categories");
    return jsonData;
  }
}
