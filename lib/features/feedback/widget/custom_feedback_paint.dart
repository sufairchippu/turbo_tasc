import 'package:flutter/cupertino.dart';
import 'package:reubro_machin_test/core/theme/app_color/app_color.dart';

class OuterShapePainter extends CustomPainter {
  static const Color borderColor = AppColors.kLightBlue;
  static const Color glowColor = Color(0xFF00BFFF); // The color for the glow
  static const Color fillColor =
      CupertinoColors.black; // The background color inside the shape

  @override
  void paint(Canvas canvas, Size size) {
    final Path path = Path();

    // Define key points and dimensions relative to the size to make it scalable
    // These values are approximations based on the image proportion
    const double notchWidth = 15.0; // Width of the top-right notch
    const double notchHeight = 10.0; // Height of the top-right notch
    const double rightArmTopIndentation = 20.0; // Indent of the top right arm
    const double rightArmHeight =
        60.0; // Overall height of the right arm section
    const double rightArmBottomIndentation =
        10.0; // Indent of the bottom right arm
    const double bottomCurveRadius = 25.0; // Radius for the bottom-right curve

    // Start from the top-left
    path.moveTo(0, 0);

    // 1. --- Top Edge ---
    // Go to the start of the top-right notch
    path.lineTo(size.width - notchWidth, 0);
    // Top-right notch (inverted V)
    path.lineTo(size.width - notchWidth / 2, notchHeight);
    path.lineTo(size.width, 0);

    // 2. --- Right Side Complex Arm ---
    // First segment of the right arm (straight down from top-right corner)
    path.lineTo(size.width, rightArmTopIndentation);
    // Angled segment inwards
    path.lineTo(size.width - rightArmIndentation, rightArmTopIndentation + 10);
    // Angled segment downwards
    path.lineTo(
      size.width - rightArmIndentation + 15,
      rightArmTopIndentation + rightArmHeight / 2,
    );
    // Angled segment outwards (the pointed part)
    path.lineTo(
      size.width - rightArmIndentation,
      rightArmTopIndentation + rightArmHeight,
    );
    // Segment down to the start of the bottom curve
    path.lineTo(
      size.width - rightArmBottomIndentation,
      size.height - bottomCurveRadius,
    );

    // 3. --- Bottom Right Curve ---
    path.arcToPoint(
      Offset(
        size.width - rightArmBottomIndentation - bottomCurveRadius,
        size.height,
      ),
      radius: const Radius.circular(bottomCurveRadius),
      clockwise: true,
    );

    // 4. --- Bottom Edge ---
    // Line across the bottom to the bottom-left corner
    path.lineTo(0, size.height);

    // 5. --- Left Edge ---
    // Line up the left side back to the start (adjusting for subtle inward angle)
    // For a slight inward angle, you could adjust the start point or add another lineTo
    path.lineTo(0, 0); // Simplified straight left edge for now

    // Close the path
    path.close();

    // --- Drawing the layers: Glow, Fill, Border ---

    // 1. Glow Layer (underneath)
    final glowPaint = Paint()
      ..color = glowColor
          .withOpacity(0.5) // Semi-transparent for glow
      ..style = PaintingStyle.stroke
      ..strokeWidth =
          6.0 // Thicker stroke for the glow effect
      ..maskFilter = const MaskFilter.blur(BlurStyle.outer, 4.0); // Apply blur

    canvas.drawPath(path, glowPaint);

    // 2. Fill Layer
    final fillPaint = Paint()
      ..color = fillColor
      ..style = PaintingStyle.fill;

    canvas.drawPath(path, fillPaint);

    // 3. Border Layer (on top)
    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0; // Thinner for the crisp outline

    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  // Helper for right arm indentation to simplify path drawing
  double get rightArmIndentation => 20.0;
}

class RobotFramePainter extends CustomPainter {
  final Color frameColor;
  final bool isSelected;

  RobotFramePainter({
    this.frameColor = AppColors.kLightBlue,
    this.isSelected = false,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Path path = Path();

    // --- Dimensions for Inner Frame Features ---
    const double notchSize = 10.0;
    const double notchOffset = 15.0;
    final double dividerY =
        0.8 * size.height; // Position of the horizontal divider line

    // 1. Start at Top-Left (0, 0)
    path.moveTo(0, 0);

    // 2. --- Top Edge ---
    // Go across to the start of the top-right notch
    path.lineTo(size.width - notchOffset, 0);

    // 3. --- Top-Right Notch (Inward angle) ---
    path.lineTo(size.width, notchSize);
    path.lineTo(size.width, dividerY); // Straight down to the divider

    // 4. --- Right Edge (Contained) ---
    // Path continues down to the bottom right corner
    path.lineTo(size.width, size.height);

    // 5. --- Bottom Edge ---
    // Go across to the start of the bottom-left notch
    path.lineTo(notchOffset, size.height);

    // 6. --- Bottom-Left Notch (Inward angle) ---
    path.lineTo(0, size.height - notchSize);
    path.lineTo(0, 0); // Connect back to start

    path.close();

    // --- Drawing ---

    // 1. Fill Paint (Optional, depending on background)
    final fillPaint = Paint()
      ..color = CupertinoColors.black.withOpacity(0.5)
      ..style = PaintingStyle.fill;
    canvas.drawPath(path, fillPaint);

    // 2. Border Paint (Uses yellow/gold if selected, blue otherwise)
    final borderPaint = Paint()
      ..color = isSelected ? AppColors.kYellowColor : frameColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    canvas.drawPath(path, borderPaint);

    // 3. Draw the Horizontal Divider Line
    final dividerPaint = Paint()
      ..color = isSelected ? AppColors.kYellowColor : frameColor
      ..strokeWidth = 2.0;

    // The line has a small gap on the right
    canvas.drawLine(
      Offset(0, dividerY),
      Offset(size.width * 0.9, dividerY),
      dividerPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
