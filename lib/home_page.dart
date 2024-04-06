import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class Globals {
  static double overallScore = 0;
  static double effects = 0;
}

double clicksPerSecond = 0.0;
double clicks = 0;

Timer timer = Timer(Duration(seconds: 1), () {});

class _HomePageState extends State<HomePage> {
  void startTimer() {
    const duration = Duration(seconds: 1);
    timer = Timer.periodic(duration, (Timer t) {
      setState(() {
        Globals.overallScore+=Globals.effects;
        clicksPerSecond = clicks + Globals.effects;
        clicks = 0;
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
  void dispose() {
    timer.cancel(); // Anuluj timer przed usunięciem obiektu stanu
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You create: " +
                '$clicksPerSecond' +
                " toucans per second!"),
            Center(
              child: GestureDetector(
                child: Image(
                  width: 200,
                  height: 300,
                    image: AssetImage(
                        'assets/Tukan1.png')),
                onTap: () {
                  setState(() {
                    Globals.overallScore++;
                    ++clicks;
                  });
                },
              ),
            ),
            Text('Your toucans: ${Globals.overallScore}'),
          ],
        ));
  }
}
