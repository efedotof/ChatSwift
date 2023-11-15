import 'package:flutter/material.dart';
import 'package:mychats/ThemeMyApp/CustomTheme.dart';
import 'package:mychats/ThemeMyApp/config.dart';



enum TriangleDirection { up, down }

class TriangleWidget extends StatelessWidget {
  final TriangleDirection direction;

  TriangleWidget({required this.direction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomPaint(
        size: Size(10, 10),
        painter: TrianglePainter(direction),
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  final TriangleDirection direction;

  TrianglePainter(this.direction);

 @override
void paint(Canvas canvas, Size size) {
  final Color triangleColor = currentTheme.currentTheme == CustomTheme.darkTheme
      ? const Color(0xFF6F6F6F)
      : const Color(0xFF6F6F6F);

     Paint paint = Paint()
    ..color = triangleColor
    ..style = PaintingStyle.fill;
    Path path = Path();

    if (direction == TriangleDirection.up) {
      path.moveTo(0, size.height);
      path.lineTo(size.width + 10, size.height);
      path.lineTo(size.width, 0);
    } else {
      path.moveTo(0, 0);
      path.lineTo(size.width + 10, 0);
      path.lineTo(size.width, size.height);
    }

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}