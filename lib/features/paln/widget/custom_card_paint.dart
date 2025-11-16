import 'package:flutter/material.dart';

class CustomPlanItemPaint extends CustomPainter {
  // Use a dark color for the fill, with a subtle gradient effect if desired
  static const Color fillColor = Color(0xFF1A1A1A);
  // Use a vibrant blue for the border/glow
  static const Color borderColor = Color(0xFF00BFFF); // A vibrant blue

  @override
  void paint(Canvas canvas, Size size) {
    final Path path = Path();

    // Define dimensions for the custom elements
    const double leftChevronDepth = 15.0; // How deep the left arrow goes
    const double leftChevronHeight =
        20.0; // Height of the left arrow (total height of the points)
    const double bottomRightNotchSize =
        10.0; // Size of the cutout on the bottom right

    // 1. Start drawing the path from the top-left, after the chevron point
    path.moveTo(leftChevronDepth, 0);

    // 2. --- Top Edge ---
    path.lineTo(size.width, 0);

    // 3. --- Right Edge ---
    path.lineTo(size.width, size.height);

    // 4. --- Bottom Edge with Angled Notch ---
    // Move to the start of the bottom-right notch
    path.lineTo(size.width * 0.90, size.height);

    // First point of the notch (moving up and left)
    path.lineTo(
      size.width * 0.90 - bottomRightNotchSize,
      size.height - bottomRightNotchSize,
    );

    // Second point of the notch (moving up and right to form the inner angle)
    path.lineTo(size.width * 0.90, size.height - bottomRightNotchSize * 2);

    // Third point of the notch (moving back down and left to form the outer angle)
    path.lineTo(
      size.width * 0.90 - bottomRightNotchSize,
      size.height - bottomRightNotchSize,
    );

    // Continue the bottom edge back towards the left chevron
    path.lineTo(leftChevronDepth, size.height);

    // 5. --- Left Chevron ---
    // Bottom point of the chevron
    path.lineTo(0, size.height - leftChevronHeight / 2);
    // Middle point of the chevron (the "tip")
    path.lineTo(leftChevronDepth, size.height / 2);
    // Top point of the chevron
    path.lineTo(0, leftChevronHeight / 2);
    // Close the path by connecting back to the start of the top edge
    path.lineTo(leftChevronDepth, 0);

    path.close(); // Important to close the path for correct fill and stroke

    // --- Drawing ---

    // Paint for the subtle gradient fill (if you want the shiny look from the image)
    // For a simple dark fill, use Paint()..color = fillColor..style = PaintingStyle.fill;
    final fillPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          fillColor.withOpacity(0.8), // Lighter top for highlight
          fillColor.withOpacity(1.0), // Darker bottom
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    // Paint for the subtle glow (underneath the main line)
    final glowPaint = Paint()
      ..color = borderColor.withOpacity(0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6.0
      ..maskFilter = const MaskFilter.blur(BlurStyle.outer, 4.0);

    // Paint for the sharp blue border line (on top)
    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0; // Slightly thinner stroke for crispness

    // Draw the glow first
    canvas.drawPath(path, glowPaint);

    // Draw the dark body fill (with gradient)
    canvas.drawPath(path, fillPaint);

    // Draw the sharp blue border line on top
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
