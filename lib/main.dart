import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';

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

class StarAnimationProvider with ChangeNotifier {
  bool _isClicked = false;
  bool get isClicked => _isClicked;

  void toggleClicked() {
    _isClicked = !_isClicked;
    notifyListeners();
  }
}

class StarAnimation3 extends StatefulWidget {
  @override
  _StarAnimation3State createState() => _StarAnimation3State();
}

class _StarAnimation3State extends State<StarAnimation3>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed ||
          status == AnimationStatus.dismissed) {
        context.read<StarAnimationProvider>().toggleClicked();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isClicked = context.watch<StarAnimationProvider>().isClicked;

    return GestureDetector(
      onTap: () {
        if (isClicked) {
          _controller.reverse();
        } else {
          _controller.forward();
        }
      },
      child: ScaleTransition(
        scale: Tween(begin: 1.0, end: 1.2).animate(CurvedAnimation(
          parent: _controller,
          curve: Curves.elasticInOut,
        )),
        child: Lottie.asset(
          'assets/lottie/star4.json', // Change the asset path here
          controller: _controller,
          onLoaded: (composition) {
            // Start the animation when loaded
            _controller
              ..duration = composition.duration
              ..forward();
          },
          width: 100,
          height: 100,
          fit: BoxFit.fill,
          delegates: LottieDelegates(
            values: [
              ValueDelegate.color(
                const ['**', 'Fill 1'],
                value: isClicked ? Colors.blue : Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
