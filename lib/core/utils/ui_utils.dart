
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reubro_machin_test/core/theme/text/app_text.dart';
// import 'package:lottie/lottie.dart';

class Uiutils {
  // static LottieBuilder getLottie(
  //   String assetName, {

  //   double? height,
  //   double? width,
  //   BoxFit? boxfit,
  //   bool? repeat,
  // }) {
  //   return Lottie.asset(
  //     assetName,
  //     fit: boxfit,
  //     height: height,
  //     width: width,
  //     repeat: repeat,
  //   );
  // }

  static SvgPicture getSvg(
    String assetName, {
    ColorFilter? color,
    double? height,
    double? width,
    BoxFit? boxfit,
  }) {
    return SvgPicture.asset(
      assetName,
      fit: boxfit ?? BoxFit.cover,
      height: height ?? 100,
      width: width ?? 60,
      colorFilter: color,
    );
  }

  static Image getassetImage(
    String assetName, {

    double? height,
    double? width,
    BoxFit? boxfit,
  }) {
    return Image.asset(
      assetName,
      fit: boxfit ?? BoxFit.cover,
      height: height ?? 100,
      width: width ?? 60,
    );
  }

  static Image getNetworkImage(
    String assetName, {

    double? height,
    double? width,
    BoxFit? boxfit,
  }) {
    return Image.network(
      assetName,
      fit: boxfit ?? BoxFit.cover,
      height: height ?? 100,
      width: width ?? 60,
    );
  }

  static Text getTextWidget(
    BuildContext context,
    String title, {
    int? maxline,
    TextOverflow? overFlow,
    Color? color,
    double? fs,
    FontWeight? fw,
    TextStyleType? textStyle,
    TextAlign? align,
  }) {
    return Text(
      title,
      style: AppText.getStyle(
        color: color,
        fontSize: fs,
        fontweight: fw,
        context,
        textStyle ?? TextStyleType.mediumbold,
      ),
      textAlign:align ,
      maxLines: maxline,
      overflow: overFlow ?? TextOverflow.ellipsis,
    );
  }
}
