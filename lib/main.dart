import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late String imagePath;
  late String imagePath2;

  final List<String> dices = [
    'images/dice1.png',
    'images/dice2.png',
    'images/dice3.png',
    'images/dice4.png',
    'images/dice5.png',
    'images/dice6.png'
  ];

  void rollDices() {
    Random random = Random();
    int index = random.nextInt(dices.length);
    int index2 = random.nextInt(dices.length);
    setState(() {
      imagePath = dices[index];
      imagePath2 = dices[index2];
    });
  }

  @override
  void initState() {
    super.initState();
    rollDices();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          backgroundColor: Colors.green[900],
          title: const Text(
            'Dice',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: Image.asset(
                          imagePath,
                          key: ValueKey<String>(imagePath),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: Image.asset(
                            imagePath2,
                            key: ValueKey<String>(imagePath),
                          ),
                        )),
                  ),
                ],
              ),
              IconButton(
                onPressed: rollDices,
                icon: const Icon(
                  Icons.refresh,
                  size: 100,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
