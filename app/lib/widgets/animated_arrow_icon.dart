import 'package:flutter/material.dart';

class AnimatedArrowIcon extends StatefulWidget {
  const AnimatedArrowIcon({super.key});

  @override
  State<AnimatedArrowIcon> createState() => _AnimatedArrowIconState();
}

class _AnimatedArrowIconState extends State<AnimatedArrowIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_controller.isAnimating) {
          _controller.stop();
        } else {
          _controller.repeat(reverse: true);
        }
      },
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.rotate(
            angle: _animation.value * 2 * 3.14,
            child: Icon(
              Icons.arrow_forward,
              size: 50,
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
