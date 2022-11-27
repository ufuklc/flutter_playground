import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shopping_list/model/Products.dart';

class ProductDetailWidget extends StatelessWidget {
  ProductDetailWidget({super.key, required this.product});

  Products product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Product Details"), backgroundColor: Colors.green),
        body: Container(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text("Product Name : ${product.name.toString()}"),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text("Product Brand : ${product.brand.toString()}"),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text("Product Price : ${product.price.toString()}"),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text("Product Count : ${product.count.toString()}"),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text("Product Type : ${product.type.toString()}"),
                ),
              ],
            ),
          ),
        ));
  }
}
