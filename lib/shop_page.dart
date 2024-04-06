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
            100,
            Icon(Icons.abc),
            0.25,"One toucan",
            () {
              setState(() {
                Globals.overallScore -= 100;
                Globals.effects+=0.25;
              });
            },
          ).makeTile()
        ],
      ),
    );
  }
}
