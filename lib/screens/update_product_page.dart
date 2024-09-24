import 'package:chat_app/models/products.dart';
import 'package:chat_app/services/update.dart';
import 'package:chat_app/widget/custom_button.dart';
import 'package:chat_app/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({super.key});

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? name, image, description;

  int? price;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Product product = ModalRoute.of(context)!.settings.arguments as Product;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              "Update Product",
              style: TextStyle(
                  fontSize: 25,
                  //fontFamily: "Pacifico",
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextField(
                  onchange: (data) {
                    name = data;
                  },
                  labelText: " Product Name",
                  hintText: " Enter Product Name",
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  onchange: (data) {
                    description = data;
                  },
                  labelText: "Description",
                  hintText: "Enter Description",
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  onchange: (data) {
                    price = int.parse(data);
                  },
                  inputType: TextInputType.number,
                  labelText: "Price",
                  hintText: "Enter Price",
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  onchange: (data) {
                    image = data;
                  },
                  labelText: "Image ",
                  hintText: " Enter Image",
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                    text: "Update",
                    color: const Color(0xff9DB0CE),
                    onPressed: () async {
                      isLoading = true;
                      setState(() {});

                      try {
                        await updateProduct(product);
                        print("Success");
                      } catch (e) {
                        print(e.toString());
                      }

                      isLoading = false;
                      setState(() {});
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(Product product) async {
    await UpdateProduct().putUpdateProduct(
        id: product.id,
        title: name == null ? product.title : name!,
        price: price == null ? product.price.toString() : price!.toString(),
        description: description == null ? product.description : description!,
        image: image == null ? product.image : image!,
        category: product.category);
  }
}
