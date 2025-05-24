// import 'package:flutter/material.dart';
// import 'package:visibility_detector/visibility_detector.dart';
//
// class AnimateOnVisible extends StatefulWidget {
//   final Widget child;
//   final Duration duration;
//   final Offset offset;
//
//   const AnimateOnVisible({
//     Key? key,
//     required this.child,
//     this.duration = const Duration(milliseconds: 700),
//     this.offset = const Offset(0, 20), // slide up by 20 pixels
//   }) : super(key: key);
//
//   @override
//   _AnimateOnVisibleState createState() => _AnimateOnVisibleState();
// }
//
// class _AnimateOnVisibleState extends State<AnimateOnVisible>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _opacity;
//   late Animation<Offset> _slide;
//
//   bool _visible = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller =
//         AnimationController(vsync: this, duration: widget.duration);
//     _opacity = Tween<double>(begin: 0, end: 1).animate(_controller);
//     _slide = Tween<Offset>(begin: widget.offset, end: Offset.zero)
//         .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   void _triggerAnimation() {
//     if (!_visible) {
//       _controller.forward();
//       _visible = true;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return VisibilityDetector(
//       key: widget.key ?? UniqueKey(),
//       onVisibilityChanged: (info) {
//         if (info.visibleFraction > 0.1) {
//           _triggerAnimation();
//         }
//       },
//       child: AnimatedBuilder(
//         animation: _controller,
//         builder: (context, child) {
//           return Opacity(
//             opacity: _opacity.value,
//             child: Transform.translate(
//               offset: _slide.value,
//               child: child,
//             ),
//           );
//         },
//         child: widget.child,
//       ),
//     );
//   }
// }
