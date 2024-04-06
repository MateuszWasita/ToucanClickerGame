import 'package:flutter/material.dart';
import 'package:toucan_clicker/home_page.dart';
import 'package:toucan_clicker/shop_tile.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}


class _ShopPageState extends State<ShopPage> {

  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Column(
        children: [
          Text('${Globals.overallScore}'),
          SizedBox(
            height: 50,
          ),
          ShopTile(
            10,
            Image(width:55, height: 55, image: AssetImage('assets/egg.png')),
            0.25,"Toucan Egg",
            () {
              setState(() {
                Globals.overallScore -= 10;
                Globals.effects+=0.25;
              });
            },
          ).makeTile(),
          ShopTile(500, Image(width: 70,height: 70,image: AssetImage('assets/nest.png')), 5, 'Toucan Nest', () {
            setState(() {
                Globals.overallScore -= 500;
                Globals.effects+=5;
              });
          },).makeTile()
        ],
      ),
    );
  }
}
