import 'package:new_product_app/model/product_model.dart';
import 'package:new_product_app/model/product_model.dart';

class ProductResponseList {
  List<ProductModel> products = [];
  ProductResponseList({required this.products});

  factory ProductResponseList.fromJson(List<dynamic> json) {
    List<ProductModel> productList = [];
    for (var productJson in json) {
      productList.add(ProductModel.fromJson(productJson));
    }
    return ProductResponseList(products: productList);
  }
}