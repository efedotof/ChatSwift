import 'package:flutter/material.dart';

class CustomProgressBar extends StatelessWidget {
  final int currentPage;
  final int totalPages;

  CustomProgressBar({
    required this.currentPage,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.fromHeight(3.0), // Высота индикатора
      painter: ProgressBarPainter(currentPage, totalPages),
    );
  }
}

class ProgressBarPainter extends CustomPainter {
  final int currentPage;
  final int totalPages;
  final double borderRadius = 4.0; // Радиус закругления
  final double gapWidth = 4.0; // Расстояние между ячейками

  ProgressBarPainter(this.currentPage, this.totalPages);

  @override
  void paint(Canvas canvas, Size size) {
    final bluePaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final grayPaint = Paint()
      ..color = Colors.grey.withOpacity(0.5) // Прозрачность для серых ячеек
      ..style = PaintingStyle.fill;

    final cellWidth = (size.width - (totalPages - 1) * gapWidth) / totalPages;
    final cellHeight = size.height;

    for (int i = 0; i < totalPages; i++) {
      if (i < currentPage) {
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromPoints(
              Offset(i * (cellWidth + gapWidth), 0),
              Offset((i + 1) * (cellWidth + gapWidth) - gapWidth, cellHeight),
            ),
            Radius.circular(borderRadius),
          ),
          bluePaint,
        );
      } else {
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromPoints(
              Offset(i * (cellWidth + gapWidth), 0),
              Offset((i + 1) * (cellWidth + gapWidth) - gapWidth, cellHeight),
            ),
            Radius.circular(borderRadius),
          ),
          grayPaint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}