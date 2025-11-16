import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import 'package:reubro_machin_test/core/constants/widgets/custom_frame_widget.dart';
import 'package:reubro_machin_test/core/mesurment/reponsive_size.dart';
import 'package:reubro_machin_test/core/router/route_names.dart';

import 'package:reubro_machin_test/core/theme/app_color/app_color.dart';
import 'package:reubro_machin_test/core/theme/text/app_text.dart';
import 'package:reubro_machin_test/core/utils/ui_utils.dart';

import 'package:reubro_machin_test/features/paln/widget/custom_card_paint.dart';

class PlanScreen extends StatelessWidget {
  const PlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> listCards = [
      Uiutils.getTextWidget(
        context,
        'UNLIMITED FREE \nTRIAL',
        textStyle: TextStyleType.subHeading,
        color: AppColors.kGreyColor,
      ),

      Uiutils.getTextWidget(
        context,
        'FREE TRIAL',
        textStyle: TextStyleType.subHeading,
        color: AppColors.kYellowColor,
      ),

      Uiutils.getTextWidget(
        context,
        'SLEEP ME MIRACLE',
        textStyle: TextStyleType.subHeading,
        fs: 22.rf(context),
      ),

      Column(
        children: [
          Uiutils.getTextWidget(
            context,
            'HAVE A GIFT CODE?',
            textStyle: TextStyleType.subHeading,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(right: 10.rw(context)),
                child: Container(
                  width: 50.rw(context),
                  decoration: BoxDecoration(
                    color: CupertinoColors.transparent,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10.rf(context)),

                    border: Border.all(
                      color: AppColors.kLightBlue,
                      width: 4.rw(context),
                    ),

                    boxShadow: [
                      BoxShadow(
                        // color: AppColors.kLightBlue,
                        blurRadius: 10.rf(context),
                        spreadRadius: 2.rf(context),
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      Uiutils.getTextWidget(
        context,
        'SIGN IN',
        textStyle: TextStyleType.subHeading,
      ),

      Row(
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
    ];
    return CustomFrameWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40.rh(context)),

          Uiutils.getTextWidget(
            context,
            'SLEEP ME',
            textStyle: TextStyleType.heading,

            fs: 35.rf(context),
          ),
          SizedBox(height: 20.rh(context)),

          Uiutils.getTextWidget(
            context,
            'SELECT   YOUR\nPLAN',
            textStyle: TextStyleType.subHeading,
          ),
          SizedBox(height: 60.rh(context)),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: listCards.length,
              itemBuilder: (context, index) => CustomPaint(
                painter: CustomPlanItemPaint(),
                child: GestureDetector(
                  onTap: () => context.pushNamed(RouteNames.feedback),
                  child: Container(
                    padding: EdgeInsets.all(10.rf(context)),
                    height: 100.rh(context),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: listCards[index],
                    ),
                  ),
                ),
              ),
              separatorBuilder: (context, index) =>
                  SizedBox(height: 25.rh(context)),
            ),
          ),
          SizedBox(height: 30.rh(context)),
        ],
      ),
    );
  }
}
