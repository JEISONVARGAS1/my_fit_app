import 'package:flutter/cupertino.dart';
import 'package:my_fit_ui_kit/my_fit_ui_kit.dart';

class SCurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = MyFitUiKit.util.color.primary
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0) // Esquina superior izquierda
      ..lineTo(0, size.height* 0.95) // Línea recta hacia abajo (lado izquierdo)
      ..cubicTo(
        size.width * 0.25, size.height , // Primer punto de control
        size.width * 0.5, size.height * 0.5, // Segundo punto de control
        size.width, size.height * 0.65, // Punto final (lado derecho)
      )
      ..lineTo(size.width, 0) // Línea recta hacia arriba (lado derecho)
      ..close(); // Cerrar el camino

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}