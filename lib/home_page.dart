import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

int overallScore = 0;
double clicksPerSecond = 0.0;
int clicks=0;

Timer timer = Timer(Duration(seconds: 1), () { });


class _HomePageState extends State<HomePage> {

 void startTimer() {
  const duration = Duration(seconds: 1);
  timer = Timer.periodic(duration, (Timer t) {
    setState(() {
    clicksPerSecond = clicks.toDouble(); 
    clicks=0;   
    });

    log(clicks.toString());
  });
}
void stopCounting() {
  timer.cancel();
}
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You are creating: " + '$clicksPerSecond' + " per second!"),
            Center(
              child: GestureDetector(
                child: Image(
                    image: AssetImage(
                        'assets/png-clipart-toucan-bird-robotic-bird-silhouette.png')),
                onTap: () {
                  setState(() {
                    ++clicks;
                    overallScore+=clicks;
                  });
                },
              ),
            ),
            Text('$overallScore'),

          ],
        ));
  }
}
