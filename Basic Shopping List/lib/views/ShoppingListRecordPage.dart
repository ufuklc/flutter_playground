import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shopping_list/model/Products.dart';
import 'package:shopping_list/views/ProductDetailsPage.dart';

import '../enums/Types.dart';

class ShoppingListRecord extends StatefulWidget {
  const ShoppingListRecord({super.key});

  @override
  State<ShoppingListRecord> createState() => _ShoppingListRecordState();
}

class _ShoppingListRecordState extends State<ShoppingListRecord> {
  TextEditingController ctName = TextEditingController();
  TextEditingController ctBrand = TextEditingController();
  TextEditingController ctPrice = TextEditingController();
  TextEditingController ctCount = TextEditingController();

  List<Products> shoppingList = <Products>[];

  Types? selectedType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Goods To Shopping List"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField(
                controller: ctName,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    hintText: "Enter the name of product"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: TextField(
                  controller: ctBrand,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      hintText: "Enter the brand of product"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: TextField(
                  controller: ctPrice,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      hintText: "Enter the price of product"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: TextField(
                  controller: ctCount,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      hintText: "Enter the counts of product"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: DropdownButton<Types>(
                  onChanged: (Types? newValue) {
                    setState(() {
                      selectedType = newValue;
                    });
                  },
                  items: Types.values.map((Types value) {
                    return DropdownMenuItem<Types>(
                      value: value,
                      child: Text(value.name),
                    );
                  }).toList(),
                ),
              ),
              !shoppingList.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(5),
                      child: DropdownButton(
                        onChanged: (Products? newValue) {
                          setState(() {});
                        },
                        items: shoppingList.map((Products value) {
                          return DropdownMenuItem<Products>(
                            value: value,
                            child: Text(value.name.toString()),
                          );
                        }).toList(),
                      ),
                    )
                  : Container(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: saveProduct,
                  child: const Text("Save"),
                ),
              ),
              !shoppingList.isEmpty
                  ? Container(
                      height: 250,
                      child: ListView.builder(
                          itemCount: shoppingList.length,
                          itemBuilder: (context, index) {
                            return Center(
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: ListTile(
                                  title:
                                      Text(shoppingList[index].name.toString()),
                                  subtitle:
                                      Text(shoppingList[index].type.toString()),
                                  leading: Icon(Icons.inventory_2),
                                  trailing: Icon(Icons.open_in_new),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ProductDetailWidget(
                                                  product: shoppingList[index]),
                                        ));
                                  },
                                ),
                              ),
                            );
                          }),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  saveProduct() {
    Products product = Products();

    product.name = ctName.text.toString();
    product.brand = ctBrand.text.toString();
    product.price = ctPrice.text.toString();
    product.count = ctCount.text.toString();
    product.type = selectedType;

    setState(() {
      shoppingList.add(product);
      ctName.text = "";
      ctBrand.text = "";
      ctPrice.text = "";
      ctCount.text = "";
    });
  }
}
