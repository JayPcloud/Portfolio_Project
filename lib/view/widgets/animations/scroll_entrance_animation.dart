import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ScrollEntrance extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Offset offset; // animation offset (e.g., Offset(0, 0.2))

  const ScrollEntrance({
    super.key,
    required this.child,
    this.duration = const Duration(seconds: 1),
    this.offset = const Offset(0, 0.2),
  });

  @override
  State<ScrollEntrance> createState() => _ScrollEntranceState();
}

class _ScrollEntranceState extends State<ScrollEntrance>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  RxBool _isVisible = false.obs;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _offsetAnimation = Tween<Offset>(
      begin: widget.offset,
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkVisibility();
    });
  }

  void _checkVisibility() {
    if(mounted) {
      final renderBox = context.findRenderObject() as RenderBox?;

      if (renderBox != null && mounted) {
        final position = renderBox.localToGlobal(Offset.zero).dy;
        final screenHeight = MediaQuery.of(context).size.height;

        if (position < screenHeight * 0.9) {
          _controller.forward();
          _isVisible.value = true;
        }
    }
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.child.hashCode.toString()),
      onVisibilityChanged: (_) => _checkVisibility(),
      child: Obx(
        ()=> AnimatedOpacity(
          duration: widget.duration,
          opacity: _isVisible.value ? 1 : 0,
          child: SlideTransition(
            position: _offsetAnimation,
            child: widget.child,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
