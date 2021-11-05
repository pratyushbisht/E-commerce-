import 'package:flutter/material.dart';
import 'package:shop/Details/details_screen.dart';
import 'package:shop/constants.dart';
import 'package:shop/models/product.dart';

List<String> categories = ["Handbag","Jewelery","Footwear","Dresses"];

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin,vertical: kDefaultPaddin/2),
          child: Text("Women",
          style: Theme.of(context).textTheme.headline5!.copyWith(fontWeight: FontWeight.bold,color: Colors.black54),),
        ),
        SizedBox(height: 10,),
        Categories(),
        SizedBox(height: 15,),
        Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin*0.5),
              child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                mainAxisSpacing: kDefaultPaddin,
                crossAxisSpacing: kDefaultPaddin*1.2,
              ) ,
                  itemCount: products.length,
                  itemBuilder: (context, index)=> ItemCard( product: products[index], press: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(product: products[index],))),
                  )
              ),
            )


        )


      ],
    );
  }
}

class ItemCard extends StatelessWidget {
  final Product product;
  final VoidCallback press;
  const ItemCard({
     Key ? key,
    required this.product,
    required this.press
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: kDefaultPaddin*0.6),
              padding: EdgeInsets.all(kDefaultPaddin*0.6),

              decoration: BoxDecoration(
                color: product.color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.asset(product.image, width: 300,height: 100,),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin/4),
            child: Text(product.title,style: TextStyle(fontWeight: FontWeight.bold,color: kTextColor),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin/4),
            child: Text("\$234",style: TextStyle(fontWeight: FontWeight.bold,color: kTextLightColor),),
          ),
        ],
      ),
    );
  }
}

class Categories extends StatefulWidget {

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  Widget buildCategory (int index) {
    return GestureDetector(
      onTap: (){
        setState((){
          selectedIndex = index;
        });
      },


      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              categories[index],
              style: TextStyle(fontWeight: FontWeight.bold,color: selectedIndex==index ? kTextColor : kTextLightColor),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: kDefaultPaddin/5),
                height: 2,
                width: 30,
                color: selectedIndex == index ? Colors.black : Colors.transparent,
              ),
            )
          ],
        ),

      ),
    );

  }

  late int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin/5),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
            itemCount: categories.length ,
            itemBuilder: (context, index) => buildCategory(index),
        ),
      ),
    );
  }
}

