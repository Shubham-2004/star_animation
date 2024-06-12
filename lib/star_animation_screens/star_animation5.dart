import 'package:flutter/material.dart';
import 'package:icon_animation/provider/star_animation_provider.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class StarAnimation5 extends StatefulWidget {
  @override
  _StarAnimation5State createState() => _StarAnimation5State();
}

class _StarAnimation5State extends State<StarAnimation5>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 50),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed ||
          status == AnimationStatus.dismissed) {
        context.read<StarAnimationProvider>().toggleClicked5();
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
    final isClicked = context.watch<StarAnimationProvider>().isClicked5;

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
          'assets/lottie/star6.json', // Change the asset path here
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
