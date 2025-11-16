import 'package:flutter/cupertino.dart';
import 'package:reubro_machin_test/core/constants/image_constants.dart';
import 'package:reubro_machin_test/core/mesurment/reponsive_size.dart';
import 'package:reubro_machin_test/core/utils/ui_utils.dart';

class CustomFrameWidget extends StatelessWidget {
  const CustomFrameWidget({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Stack(
        children: [
          Positioned.fill(
            child: Uiutils.getassetImage(
              ImageConstants.backgroundImage,
              width: 2000.rw(context),
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.rh(context)),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
