import 'package:flutter/material.dart';
import 'package:shop/constants.dart';
import 'package:shop/models/product.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
     child: Column(
       children: [
         SizedBox(
           height: size.height,
           child: Stack(
             children: [
               Container(
                 margin: EdgeInsets.only(top: size.height*0.3 ),
                 padding: EdgeInsets.only(top: size.height*0.12,left: kDefaultPaddin,right: kDefaultPaddin),
                 height: 500,
                 decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
                 ),
                 child: Column(
                   children: [
                     Row(

                       children: [
                         Expanded(
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text("Color",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20),),
                               Row(
                                 children: <Widget>[
                                   ColorDot(colorr: Color(0xFF356C95),isSelected: true,),
                                   ColorDot(colorr: Color(0xFFF8C078),),
                                   ColorDot(colorr: Color(0xFFA29B9B),),

                                 ],
                               )

                             ],
                           ),
                         ),
                         Expanded(
                           child: RichText(text: TextSpan(
                             style: TextStyle(color: kTextColor),
                             children: [
                               TextSpan(text: "Size\n"),
                               TextSpan(text: "${product.size} cm",style: Theme.of(context).textTheme.headline5!.copyWith(fontWeight: FontWeight.bold)),

                             ]


                           )),
                         ),



                       ],
                     ),
                     SizedBox(height: 30,),
                     Text("${product.description}",
                     style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18),),
                     SizedBox(height: 30,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         CounterCart(),
                         Container(
                           height: 32,
                           width: 32,
                           padding: EdgeInsets.all(8),
                           decoration: BoxDecoration(color: Color(0xFFFF6464),shape: BoxShape.circle),
                           child: Icon(Icons.thumb_up,size: 16,color: Colors.white,),


                         )
                       ],
                     ),
                     SizedBox(height: 30,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Container(
                           height: 50,
                           width: 58,
                           decoration: BoxDecoration(border: Border.all(color: product.color),borderRadius: BorderRadius.circular(12)),
                           child: Icon(Icons.shopping_cart,color: product.color,),

                         ),
                         Container(
                           height: 50,
                           width: size.width*0.6,
                           decoration: BoxDecoration(color: product.color,borderRadius: BorderRadius.circular(12)),
                           child: Center(child: Text("Buy Now",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),)),

                         ),


                       ],
                     )


                   ],



                 ),
               ),
               ProductTitleWithImage(product: product)




             ],




           ),
         )




       ],
     ),


    );
  }
}

class CounterCart extends StatefulWidget {

  @override
  _CounterCartState createState() => _CounterCartState();
}

class _CounterCartState extends State<CounterCart> {
  int numberr = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 40,
          height: 32,
          child: OutlinedButton(


            onPressed: (){
              setState(() {
                numberr=numberr-1;
              });
            },
            child: Icon(Icons.remove_outlined),

          ),

        ),
        SizedBox(width: 10,),
        Text("$numberr",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
        SizedBox(width: 10,),
        SizedBox(
          width: 40,
          height: 32,
          child: OutlinedButton(


            onPressed: (){
              setState(() {
                numberr=numberr+1;
              });
            },
            child: Icon(Icons.add),

          ),

        ),
        SizedBox(width: 40,),





      ],


    );
  }
}
















class ColorDot extends StatelessWidget {
  final Color colorr;
  final bool isSelected;
  const ColorDot({
    Key? key,
    required this.colorr,
     this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: kDefaultPaddin/4,
        right: kDefaultPaddin*0.9,
      ),
      padding: EdgeInsets.all(2.5),
      height: 24,width: 24,
      decoration: BoxDecoration(border: Border.all(color: isSelected? colorr: Colors.transparent),
        borderRadius: BorderRadius.circular(360),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colorr,
          shape: BoxShape.circle,
        ),


      ),
    );
  }
}

class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Aristocratic Handbag",
           style: TextStyle(
             color: Colors.white,
             fontSize: 20,
           ),
          ),
          Text(product.title,
          style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white,fontWeight: FontWeight.bold),

          ),
          Row(
            children: [
              RichText(text: TextSpan(
                children: [
                  TextSpan(text: "Price\n"),
                  TextSpan(text: "\$${product.price}",
                  style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white,fontWeight: FontWeight.bold)
                  ),
                ]

              )
              ),
              SizedBox(width: 20,),
              Expanded(
                child: Image.asset(product.image,
                fit: BoxFit.fill,
                ),

              ),
            ],
          )
        ],
      ),
    );
  }
}
