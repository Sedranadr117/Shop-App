

import 'package:chat_app/helper/api.dart';
import 'package:chat_app/models/products.dart';


class AllProduct {
  Future<List<Product>> getAllProduct() async {
     List<dynamic> jsonData=await Api().get(url: "https://fakestoreapi.com/products");
  

      List<Product> productlist = [];
      for (int i = 0; i < jsonData.length; i++) {
        productlist.add(Product.fromJson(jsonData[i]));
      }
      return productlist;
    } 
  }

