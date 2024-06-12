import 'package:flutter/material.dart';
import 'package:icon_animation/provider/star_animation_provider.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class StarAnimation1 extends StatefulWidget {
  @override
  _StarAnimation1State createState() => _StarAnimation1State();
}

class _StarAnimation1State extends State<StarAnimation1>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 10), // Set a reasonable duration
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void toggleAnimation(StarAnimationProvider provider) {
    if (provider.isClicked1) {
      // Just change color to white without animation
      provider.toggleClicked1();
    } else {
      // Play forward animation and change color to blue
      _controller.forward(from: 0).then((_) {
        provider.toggleClicked1();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<StarAnimationProvider>(
      builder: (context, provider, child) {
        final isClicked = provider.isClicked1;

        return GestureDetector(
          onTap: () => toggleAnimation(provider),
          child: Lottie.asset(
            'assets/lottie/star1.json', // Change the asset path here
            controller: _controller,
            onLoaded: (composition) {
              // Set the duration of the animation to the composition's duration
              _controller.duration = composition.duration;
            },
            width: 100,
            height: 100,
            fit: BoxFit.fill,
            delegates: LottieDelegates(
              values: [
                ValueDelegate.color(
                  const ['**', 'Fill 1'],
                  value: isClicked ? Colors.blue : Colors.blue,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
