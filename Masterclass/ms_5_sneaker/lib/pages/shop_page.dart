import 'package:flutter/material.dart';
import 'package:ms_5_sneaker/models/cart.dart';
import 'package:ms_5_sneaker/models/shoe.dart';
import 'package:ms_5_sneaker/pages/shoe_tile.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void addToCart(Shoe individualShoe){
    Provider.of<Cart>(context,listen: false).addItemToCart(individualShoe);

    showDialog(context: context, builder: (context) => const AlertDialog(
        title: Text("Successfully added!"),
        content: Text("Check your cart"),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder:(context, value, child) => Column(
      children: [
        // search bar
        Container(
          padding: const  EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
              color: Colors.grey[100], borderRadius: BorderRadius.circular(8)),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Search"), Icon(Icons.search)],
          ),
        ),
        // message
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Text(
            "everyone flies.. some fly longer than others",
            style: TextStyle(color: Colors.grey[600]),
          ),
        ),
        // hot picks
        const Padding(
          padding: const EdgeInsets.all(25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Hot Picks 🔥",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              Text(
                "See all",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        //List of shoes
        Expanded(
          child: 
            ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
              Shoe shoe= value.getShoeList()[index];
              
              return ShoeTile(
                shoe:shoe,
                onTap: ()=> addToCart(shoe));
            },
          )
        ),
        const Padding(padding: EdgeInsets.only(top: 25,left:25,right: 25),
        child: Divider(
          color:Colors.white
        ),)
      ],
    ));
  }
}
