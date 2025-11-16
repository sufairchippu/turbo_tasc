import 'package:flutter/cupertino.dart';
import 'package:reubro_machin_test/core/constants/image_constants.dart';
import 'package:reubro_machin_test/core/constants/svg_constants.dart';
import 'package:reubro_machin_test/core/constants/widgets/custom_frame_widget.dart';
import 'package:reubro_machin_test/core/mesurment/reponsive_size.dart';
import 'package:reubro_machin_test/core/theme/app_color/app_color.dart';
import 'package:reubro_machin_test/core/theme/text/app_text.dart';
import 'package:reubro_machin_test/core/utils/ui_utils.dart';

class WelcomeScreen2 extends StatelessWidget {
  const WelcomeScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFrameWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 30.rh(context),
        children: [
          SizedBox(height: 40.rh(context)),
          Uiutils.getTextWidget(context, '''SLEEP ME CAN HEAL... 
CHRONIC/SEVERE INSOMNIA
WITH ITS A.I. POWERED 
PERSONALIZED SLEEP REMEDY PROGRAM.''', fs: 16.rf(context)),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Uiutils.getassetImage(
                ImageConstants.person,
                width: 120.rw(context),
                height: 120,
              ),
              Uiutils.getTextWidget(
                context,
                '''SLEEP ME HAS BEEN
SCIENTIFICALLY
DESIGNED BY ME
OVER MANY YEARS."''',
                color: AppColors.kWhite,
                fs: 14.rf(context),
              ),
            ],
          ),
          Uiutils.getTextWidget(context, '''PANKAJ GUPTA, FOUNDER
THE PANKAJ METHOD ®''', color: AppColors.kWhite),
          Uiutils.getTextWidget(
            maxline: 6,
            context,
            '''I HEAL INCURABLE PHYSICAL AND MENTAL HEALTH CONDITIONS. MANY OF MY PATIENTS HAVE POOR SLEEP SO I DEVELOPED A QUICK,
POWERFUL SLEEP SOLUTION THAT IS NOW OFFERED HERE:''',
            fs: 14.rf(context),
          ),
          Uiutils.getTextWidget(
            maxline: 6,
            context,

            '''FROM NOW ON, YOU CAN SLEEP WELL EVERY NIGHT!''',
            fs: 14.rf(context),
            color: AppColors.kWhite,
          ),
          Uiutils.getTextWidget(
            maxline: 6,
            context,
            '''READ TERMS AND CONDITIONS AND PRIVACY POLICY''',
            fs: 14.rf(context),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Uiutils.getSvg(SvgConstants.verify),
              Uiutils.getTextWidget(
                maxline: 7,
                context,
                '''ACCEPT THE TERMS \nAND CONDITIONS AND \nPRIVACY POLICY. *.''',
                textStyle: TextStyleType.largeBold,
                color: AppColors.kWhite,
              ),
            ],
          ),
          SizedBox(height: 20.rh(context)),
        ],
      ),
    );
  }
}
