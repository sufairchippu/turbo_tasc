import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import 'package:reubro_machin_test/core/constants/widgets/custom_frame_widget.dart';
import 'package:reubro_machin_test/core/mesurment/reponsive_size.dart';
import 'package:reubro_machin_test/core/router/route_names.dart';
import 'package:reubro_machin_test/core/theme/app_color/app_color.dart';
import 'package:reubro_machin_test/core/theme/text/app_text.dart';
import 'package:reubro_machin_test/core/utils/ui_utils.dart';
import 'package:reubro_machin_test/features/paln/widget/custom_card_paint.dart';

class WelcomeScreeen extends StatelessWidget {
  const WelcomeScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFrameWidget(
      child: Column(
        spacing: 12.rh(context),
        children: [
          SizedBox(height: 70.rh(context)),
          Uiutils.getTextWidget(
            context,
            "SLEEP ME",
            textStyle: TextStyleType.subHeading,
          ),
          Uiutils.getTextWidget(
            context,
            'FALL ASLEEP IN MINITUS \nANYTIME ANYWHERE!',
            textStyle: TextStyleType.mediumbold,
          ),
          Uiutils.getTextWidget(
            context,
            '3 DAY',
            textStyle: TextStyleType.mediumbold,
            color: AppColors.kWhite,
            fs: 20.rf(context),
          ),
          Row(
            children: [
              Container(
                color: AppColors.kLightBlue,
                height: 2.rh(context),
                width: 100.rh(context),
              ),
              Container(
                height: 10.rh(context),
                width: 10.rw(context),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.kLightBlue,
                ),
              ),
              const Spacer(),
              Container(
                height: 10.rh(context),
                width: 10.rw(context),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.kLightBlue,
                ),
              ),
              Container(
                color: AppColors.kLightBlue,
                height: 2.rh(context),
                width: 100.rh(context),
              ),
            ],
          ),
          Uiutils.getTextWidget(context, 'FREE TRIAL', fs: 18.rf(context)),
          const SizedBox(),
          Row(
            spacing: 8.rw(context),
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Uiutils.getTextWidget(
                context,
                'NO',
                fs: 18.rf(context),
                color: AppColors.kWhite,
              ),
              Uiutils.getTextWidget(context, 'LOGIN', fs: 18.rf(context)),
            ],
          ),
          Row(
            spacing: 8.rw(context),
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Uiutils.getTextWidget(
                context,
                'NO',
                fs: 18.rf(context),
                color: AppColors.kWhite,
              ),
              Uiutils.getTextWidget(context, 'EMAIL', fs: 18.rf(context)),
            ],
          ),
          Row(
            spacing: 8.rw(context),
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Uiutils.getTextWidget(
                context,
                'NO',
                fs: 18.rf(context),
                color: AppColors.kWhite,
              ),
              Uiutils.getTextWidget(context, 'WIFI', fs: 18.rf(context)),
            ],
          ),
          Row(
            spacing: 8.rw(context),
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Uiutils.getTextWidget(
                context,
                'NO',
                fs: 18.rf(context),
                color: AppColors.kWhite,
              ),
              Uiutils.getTextWidget(context, 'CREDIT CARD', fs: 18.rf(context)),
            ],
          ),
          SizedBox(height: 12.rh(context)),

          Uiutils.getTextWidget(
            context,
            'SLEEP WITH ONE CLICK',
            fs: 16.rf(context),
          ),
          SizedBox(height: 10.rh(context)),
          CustomPaint(
            painter: CustomPlanItemPaint(),
            child: GestureDetector(
              onTap: () => context.pushNamed(RouteNames.welcome2),
              child: SizedBox(
                height: 80.rh(context),
                width: double.infinity,
                child: Center(
                  child: Uiutils.getTextWidget(
                    context,
                    '     START\n FREE TRAIL',
                    textStyle: TextStyleType.subHeading,
                    color: AppColors.kWhite,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10.rh(context)),
          Uiutils.getTextWidget(
            context,
            maxline: 8,
            'SLEEP ME ALSO HAS A FREE DAILY STRESS REDUCING FEATURES KEEO YOUR APP NOTIFICATIONS ON AND LET SLEEP ME REDUCE YOUR DAILY STRESS IN SECONDS!',
            textStyle: TextStyleType.largeBold,
          ),
        ],
      ),
    );
  }
}
