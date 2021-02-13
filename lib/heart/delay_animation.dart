import 'dart:async';
import 'package:flutter/material.dart';

class DelayAnimation extends StatefulWidget {
  final Widget parentWidget;
  final int timer;

  DelayAnimation(this.parentWidget, this.timer);
  @override
  _DelayAnimationState createState() => _DelayAnimationState();
}

class _DelayAnimationState extends State<DelayAnimation>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _animOffset;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    final curve =
        CurvedAnimation(curve: Curves.decelerate, parent: _controller);
    _animOffset =
        Tween<Offset>(begin: const Offset(0.0, 0.35), end: Offset.zero)
            .animate(curve);

    if (widget.timer == null) {
      _controller.forward();
    } else {
      Timer(Duration(milliseconds: widget.timer), () {
        _controller.forward();
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      child: SlideTransition(
        position: _animOffset,
        child: widget.parentWidget,
      ),
      opacity: _controller,
    );
  }
}
