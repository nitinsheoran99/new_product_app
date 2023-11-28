import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:new_product_app/model/product_list.dart';
import 'package:new_product_app/model/product_model.dart';
import 'package:new_product_app/util/api_endpoints.dart';

class ProductApiService{
  static Future<List<ProductModel>> getProductInfo() async {
    String url = ApiEndpoint.baseURl;
    http.Response response = await http.get(
      Uri.parse(url),

    );
    if (response.statusCode == 200) {
      String body = response.body;
      final data = jsonDecode(body);

      ProductResponseList productResponseList= ProductResponseList.fromJson(data);
      return productResponseList.products;
    } else {
      throw 'Something went wrong';
    }
  }
}