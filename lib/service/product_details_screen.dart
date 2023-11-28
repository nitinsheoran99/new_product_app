import 'package:flutter/material.dart';
import 'package:new_product_app/model/product_model.dart';

class ProductDetailsScreen extends StatefulWidget {
   ProductDetailsScreen({super.key,required this.productModel});
  ProductModel? productModel;
  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.network(widget.productModel!.price.toString()),
        ],
      ),
    );
  }
}
