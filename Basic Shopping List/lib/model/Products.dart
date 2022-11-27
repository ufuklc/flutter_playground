import '../enums/Types.dart';

class Products {
  String? name;
  String? brand;
  String? price;
  String? count;
  Types? type;

  List<Products> products = <Products>[];

  List<Products> getProducts() {
    return products;
  }

  Products getProductDetail(String name) {
    return products.firstWhere((element) => element.name == name);
  }

  bool save(Products product) {
    products.add(product);
    return true;
  }
}
