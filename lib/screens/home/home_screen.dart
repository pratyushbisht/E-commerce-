import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop/components/body.dart';
import 'package:shop/constants.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,),
        onPressed: (){},

        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search),color: Colors.black,),
          IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart,color: Colors.black,)),
          SizedBox(width: kDefaultPaddin/2,),
        ],
      ),
      body: Body(),





    );
  }
}
