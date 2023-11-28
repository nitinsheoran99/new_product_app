import 'package:flutter/cupertino.dart';
import 'package:new_product_app/model/product_model.dart';
import 'package:new_product_app/service/product_api_response.dart';

class ProductProvider extends ChangeNotifier {
  List<ProductModel> productList = [];

  Future fetchData() async {
    productList = await ProductApiService.getProductInfo();
    notifyListeners();
  }
}
