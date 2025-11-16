import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reubro_machin_test/core/mesurment/reponsive_size.dart';
import 'package:reubro_machin_test/core/theme/app_color/app_color.dart';

enum TextStyleType {
  heading,
  subHeading,
  largeBold,
  mediumbold,
  smallBold,

  extraSmallRegular,
}

class AppText {
  static TextStyle getStyle(
    BuildContext context,
    TextStyleType type, {
    Color? color,
    FontWeight? fontweight,
    double? fontSize,
  }) {
    final defaultzColor = color ?? AppColors.kLightBlue;

    TextStyle buildStyle({
      required double size,
      required FontWeight fw,
      required Color clr,
    }) {
      return GoogleFonts.orbitron(
        textStyle: TextStyle(
          fontWeight: fw,
          fontSize: size.rf(context),
          color: clr,
        ),
      );
    }

    switch (type) {
      case TextStyleType.heading:
        return buildStyle(
          size: fontSize ?? 24.rf(context),
          fw: fontweight ?? FontWeight.bold,
          clr: defaultzColor,
        );

      case TextStyleType.subHeading:
        return buildStyle(
          size: fontSize ?? 20.rf(context),
          fw: fontweight ?? FontWeight.bold,
          clr: defaultzColor,
        );

      case TextStyleType.largeBold:
        return buildStyle(
          size: fontSize ?? 16.rf(context),
          fw: fontweight ?? FontWeight.bold,
          clr: defaultzColor,
        );

      case TextStyleType.extraSmallRegular:
        return buildStyle(
          size: fontSize ?? 10.rf(context),
          fw: fontweight ?? FontWeight.w400,
          clr: defaultzColor,
        );

      case TextStyleType.mediumbold:
        return buildStyle(
          size: fontSize ?? 12.rf(context),
          fw: fontweight ?? FontWeight.bold,
          clr: defaultzColor,
        );

      case TextStyleType.smallBold:
        return buildStyle(
          size: fontSize ?? 20.rf(context),
          fw: fontweight ?? FontWeight.bold,
          clr: defaultzColor,
        );
    }
  }
}
