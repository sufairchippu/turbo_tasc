import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:reubro_machin_test/core/constants/image_constants.dart';
import 'package:reubro_machin_test/core/constants/svg_constants.dart';
import 'package:reubro_machin_test/core/constants/widgets/custom_frame_widget.dart';
import 'package:reubro_machin_test/core/mesurment/reponsive_size.dart';
import 'package:reubro_machin_test/core/router/route_names.dart';
import 'package:reubro_machin_test/core/theme/app_color/app_color.dart';
import 'package:reubro_machin_test/core/theme/text/app_text.dart';
import 'package:reubro_machin_test/core/utils/ui_utils.dart';
import 'package:reubro_machin_test/features/paln/widget/custom_card_paint.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFrameWidget(
      child: Column(
        spacing: 20.rh(context),
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(height: 30.rh(context)),
          Row(
            spacing: 10.rw(context),
            children: [
              Uiutils.getSvg(SvgConstants.menu1, height: 30.rh(context)),
              Uiutils.getTextWidget(context, 'MENU'),
              const Spacer(),
              Uiutils.getTextWidget(context, 'CLOSE'),

              Uiutils.getSvg(SvgConstants.menu2, height: 30.rh(context)),
            ],
          ),
          Uiutils.getTextWidget(
            context,
            'SLEEP ME',
            textStyle: TextStyleType.heading,
          ),
          Uiutils.getTextWidget(
            context,
            'MIRACLE',
            textStyle: TextStyleType.heading,
          ),
          Uiutils.getTextWidget(
            context,
            'What do you\nfeel like doing now!',
            textStyle: TextStyleType.mediumbold,
            fs: 16.rf(context),
            align: TextAlign.end,
          ),
          Container(
            child: Center(child: Uiutils.getassetImage(ImageConstants.galexy)),
          ),
          const Spacer(),
          CustomPaint(
            painter: CustomPlanItemPaint(),
            child: GestureDetector(
              onTap: () => context.pushNamed(RouteNames.welcome),
              child: Container(
                padding: EdgeInsets.all(10.rf(context)),
                height: 90.rh(context),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Uiutils.getTextWidget(
                            context,
                            'SHARE',
                            textStyle: TextStyleType.subHeading,
                            color: AppColors.kYellowColor,
                          ),
                          Uiutils.getTextWidget(
                            context,
                            'SLEEP ME',
                            textStyle: TextStyleType.subHeading,
                          ),
                        ],
                      ),
                      Uiutils.getTextWidget(
                        context,
                        'FREE  \nGIFT',
                        textStyle: TextStyleType.subHeading,
                        color: AppColors.kYellowColor,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,

            spacing: 10.rw(context),
            children: [
              Uiutils.getTextWidget(
                context,
                'UPGRADE',
                color: AppColors.kYellowColor,
              ),
              Uiutils.getTextWidget(context, 'SLEEP ME'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            spacing: 10.rw(context),
            children: [
              Uiutils.getTextWidget(context, 'MIRACLE'),
              Uiutils.getTextWidget(
                context,
                '>>',
                color: AppColors.kYellowColor,
              ),
            ],
          ),
          SizedBox(height: 20.rh(context)),
        ],
      ),
    );
  }
}
