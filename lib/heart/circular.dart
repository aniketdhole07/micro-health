import 'package:flutter/material.dart';
import 'dart:math' as math;

class CircularProgress extends StatefulWidget {
  final Widget heart;
  CircularProgress(this.heart);
  @override
  _CircleProgressState createState() => _CircleProgressState();
}

class _CircleProgressState extends State<CircularProgress>
    with SingleTickerProviderStateMixin {
  AnimationController progressController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    progressController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    animation = Tween<double>(begin: 0, end: 100).animate(progressController)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        foregroundPainter: CircleProgress(
            animation.value), // this will add custom painter after child
        child: Container(
          width: 200,
          height: 200,
          child: GestureDetector(
              onTap: () {
                if (animation.value == 100) {
                  progressController.reverse();
                } else {
                  progressController.forward();
                }
              },
              child: Center(child: widget.heart)),
        ),
      ),
    );
  }
}

class CircleProgress extends CustomPainter {
  double currentProgress;

  CircleProgress(this.currentProgress);

  @override
  void paint(Canvas canvas, Size size) {
    //this is base circle
    Paint outerCircle = Paint()
      ..strokeWidth = 10
      ..color = Colors.black
      ..style = PaintingStyle.stroke;

    Paint completeArc = Paint()
      ..strokeWidth = 10
      ..color = Colors.redAccent
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = math.min(size.width / 2, size.height / 2 - 1);

    canvas.drawCircle(
        center, radius, outerCircle); // this draws main outer circle

    double angle = 2 * math.pi * (currentProgress / 100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
        -math.pi / 2, angle, false, completeArc);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // ignore: todo
    // TODO: implement shouldRepaint
    return true;
  }
}
