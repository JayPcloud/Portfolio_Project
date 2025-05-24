import 'package:flutter/material.dart';

class OnHoverSwipeAnimation extends StatefulWidget {
  final Widget child;

  const OnHoverSwipeAnimation({super.key, required this.child});

  @override
  State<OnHoverSwipeAnimation> createState() => _OnHoverSwipeAnimationState();
}

class _OnHoverSwipeAnimationState extends State<OnHoverSwipeAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<double> _offset;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );

    _opacity = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.0), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.0), weight: 50),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _offset = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: -20.0), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 20.0, end: 0.0), weight: 50),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  void _runAnimation() {
    if (_controller.isAnimating) return;
    _controller.forward(from: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _runAnimation(),
      child: ClipRect(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Opacity(
              opacity: _opacity.value,
              child: Transform.translate(
                offset: Offset(0, _offset.value),
                child: child,
              ),
            );
          },
          child: widget.child
        ),
      ),
    );
  }
}
