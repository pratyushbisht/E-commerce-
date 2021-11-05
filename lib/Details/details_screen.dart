import 'package:flutter/material.dart';
import 'package:shop/Componentss/body.dart';
import 'package:shop/models/product.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;

  const DetailsScreen({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: product.color,
      appBar: AppBar(
    backgroundColor: product.color,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: () => Navigator.pop(context),),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart)),
          IconButton(onPressed: (){}, icon: Icon(Icons.search)),
        ],
      ),
      body: Body(product: product,),




    );
  }
}
