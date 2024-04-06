import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:toucan_clicker/home_page.dart';
import 'package:toucan_clicker/styles.dart';

class ShopTile {
  late double cost;
  late Image image;
  late double effect;
  late String text;
  late final VoidCallback updateState;

  ShopTile(double cost,Image image,double effect, String text, VoidCallback updateState) {
    this.cost=cost;
    this.image=image;
    this.effect = effect;
    this.text=text;
    this.updateState = updateState;
  }

  Column makeTile() {
    return Column(
      children: [
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.symmetric(horizontal: 0)),
                
            onPressed: () {
              if(Globals.overallScore>=cost){
              updateState();
              }
            },
            child: Container(
              height: 80,
              width: 300,
              decoration: BoxDecoration(
                color: Globals.overallScore>=cost? Colors.green : Colors.grey,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: image,
                  ),
                  SizedBox(width: 10,),
                  Text(text, style: shopStyle,),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Text('x'+effect.toString(), style: shopStyle,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Image(
                  width: 50,
                  height: 50,
                    image: AssetImage(
                        'assets/Tukan1.png')),
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Cost: " + '$cost', style: shopStyle,),
            SizedBox(width: 10,),
            
          ],
        )
      ],
    );
  }
}
