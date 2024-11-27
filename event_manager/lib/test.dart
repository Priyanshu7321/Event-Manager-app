import 'package:flutter/material.dart';



// Usage Example Widget
class CustomBannerShape extends StatelessWidget {

  final Color color;
  final Widget? child;

  const CustomBannerShape({
    Key? key,
    this.color = Colors.purple,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: double.infinity,
      width: double.infinity,
      child:Column(
        children: [SizedBox(
          height: 200,
          width: 200,
          child: CustomPaint(
            painter: CustomBentShapePainter(),
            size: Size(300, 300),
          ),
        ),],
      )
        ),
    );
  }
}

class CustomBentShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue // Background color of the shape
      ..style = PaintingStyle.fill; // Fill the shape

    final path = Path();

    // Start at the bottom-left corner
    path.moveTo(0, size.height);

    // Slight bend at the bottom-left
    path.quadraticBezierTo(
      size.width * 0.05, size.height * 0.8, // Control point for the curve
      size.width * 0.1, size.height * 0.8, // End point of the curve
    );

    // Top-left corner with slight curve
    path.quadraticBezierTo(
      size.width * 0.15, 0, // Control point for the curve
      size.width * 0.3, 0, // End point of the curve
    );

    // Top-right corner with slight curve
    path.lineTo(size.width * 0.7, 0);
    path.quadraticBezierTo(
      size.width * 0.85, 0, // Control point for the curve
      size.width * 0.9, size.height * 0.8, // End point of the curve
    );

    // Slight bend at the bottom-right
    path.quadraticBezierTo(
      size.width * 0.95, size.height * 0.8, // Control point for the curve
      size.width, size.height, // End point of the curve
    );

    // Close the path
    path.close();

    // Draw the path
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // No need to repaint for static shapes
  }
}