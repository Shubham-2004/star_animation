import 'package:flutter/material.dart';
import 'package:icon_animation/provider/star_animation_provider.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

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
      duration: Duration(milliseconds: 1), // Set a reasonable duration
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void toggleAnimation(StarAnimationProvider provider) {
    if (provider.isClicked3) {
      // Just change color to white without animation
      provider.toggleClicked3();
    } else {
      // Play forward animation and change color to blue
      _controller.forward(from: 0).then((_) {
        provider.toggleClicked3();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<StarAnimationProvider>(
      builder: (context, provider, child) {
        final isClicked = provider.isClicked3;

        return GestureDetector(
          onTap: () => toggleAnimation(provider),
          child: Lottie.asset(
            'assets/lottie/star3.json', // Change the asset path here
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
                  value: isClicked ? Colors.blue : Colors.grey,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
