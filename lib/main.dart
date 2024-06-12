import 'package:flutter/material.dart';
import 'package:icon_animation/provider/star_animation_provider.dart';
import 'package:icon_animation/star_animation_screens/star_animation3.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => StarAnimationProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Lottie Animation Examples')),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              StarAnimation3(),
            ],
          ),
        ),
      ),
    );
  }
}
