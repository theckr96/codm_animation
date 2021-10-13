import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'dart:math' as math;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'codm animation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CodAnimation(),
    );
  }
}

class CodAnimation extends StatefulWidget {
  @override
  _CodAnimationState createState() => _CodAnimationState();
}

class _CodAnimationState extends State<CodAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _controller2;
  late AnimationController _controller3;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2))
          ..repeat();
    _controller2 =
        AnimationController(vsync: this, duration: Duration(seconds: 2))
          ..repeat();
    _controller3 =
        AnimationController(vsync: this, duration: Duration(seconds: 5))
          ..repeat();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff272727),
      body: Center(
        child: Stack(
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (_, child) {
                return Transform.rotate(
                  angle: _controller.value * 2 * math.pi,
                  child: child,
                );
              },
              child: Container(
                  height: 100,
                  width: 100,
                  child: CustomPaint(
                    painter: FirstCanvas(),
                  )),
            ),
            AnimatedBuilder(
              animation: _controller2,
              builder: (_, child) {
                return Transform.rotate(
                  angle: _controller2.value * 2 * math.pi * -1,
                  child: child,
                );
              },
              child: Container(
                  height: 100,
                  width: 100,
                  child: CustomPaint(
                    painter: SecondCanvas(),
                  )),
            ),
            AnimatedBuilder(
              animation: _controller3,
              builder: (_, child) {
                return Transform.rotate(
                  angle: _controller3.value * 2 * math.pi,
                  child: child,
                );
              },
              child: Container(
                  height: 100,
                  width: 100,
                  child: CustomPaint(
                    painter: ThirdCanvas(),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class FirstCanvas extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint myArc = Paint()
      ..color = Color(0xFF6E6A3B)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;
    // Rect rect1 = Rect.fromLTRB(        size.width * .1, size.height * .1, size.width * .9, size.height * .9);
    Rect rect1 = new Rect.fromLTWH(0.0, 0.0, size.width, size.height);
    canvas.drawArc(rect1, 0, pi * .5, false, myArc);
    canvas.drawArc(rect1, pi, pi * .5, false, myArc);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class SecondCanvas extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint myArc = Paint()
      ..color = Color(0xFF677068)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;
    //Rect rect1 = new Rect.fromLTWH(0.0, 0.0, size.width, size.height);
    Rect rect1 = Rect.fromLTRB(size.width * .07, size.height * .07,
        size.width * .93, size.height * .93);
    canvas.drawArc(rect1, .25 * pi, -pi * .25, false, myArc);
    canvas.drawArc(rect1, pi, pi * .25, false, myArc);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class ThirdCanvas extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint myArc = Paint()
      ..color = Color(0xFF434430)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;
    Rect rect1 = Rect.fromLTRB(size.width * .15, size.height * .15,
        size.width * .85, size.height * .85);

    canvas.drawArc(rect1, 0, pi * .5, false, myArc);
    canvas.drawArc(rect1, pi, pi * .5, false, myArc);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
