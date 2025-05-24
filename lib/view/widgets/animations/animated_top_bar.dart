import 'package:flutter/cupertino.dart';

class AnimatedTopBar extends StatefulWidget {
  final Widget child;
  const AnimatedTopBar({super.key, required this.child});

  @override
  State<AnimatedTopBar> createState() => _AnimatedTopBarState();
}

class _AnimatedTopBarState extends State<AnimatedTopBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    _opacity = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));
    _scale = Tween<double>(begin: 0.6, end: 1).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    ));

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacity,
      child: ScaleTransition(
        scale: _scale,
        child: widget.child,
      ),
    );
  }
}
