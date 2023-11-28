import 'package:flutter/material.dart';
import 'package:new_product_app/model/product_model.dart';
import 'package:new_product_app/provider/product_provider.dart';
import 'package:new_product_app/service/product_api_response.dart';
import 'package:new_product_app/service/product_details_screen.dart';
import 'package:provider/provider.dart';


class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late ProductProvider productProvider;

  @override
  void initState() {
    productProvider = Provider.of<ProductProvider>(context,listen:false);
    super.initState();
    productProvider.fetchData();

  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, ProductProvider value, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Product'),
          ),
          body: ListView.builder(
            itemCount: value.productList.length,
            itemBuilder: (context, index) {
              ProductModel productModel =value.productList[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return ProductDetailsScreen(productModel: productModel,);
                  }));
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Card(
                    child: Column(
                      children: [
                        Image.network(
                          productModel.images != null && productModel.images!.isNotEmpty
                              ? productModel.images![0]
                              : 'placeholder_url',
                          fit: BoxFit.fill,
                          height: MediaQuery.of(context).size.height * 0.15,
                        ),
                        ListTile(
                          title: Text('Name : ${productModel.title}'),
                          subtitle: Text("Price : \$${productModel.price.toString()}"),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },

    );
  }
}