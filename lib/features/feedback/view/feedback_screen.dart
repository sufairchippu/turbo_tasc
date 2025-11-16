import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reubro_machin_test/core/constants/app_constants.dart';
import 'package:reubro_machin_test/core/constants/image_constants.dart';
import 'package:reubro_machin_test/core/constants/widgets/custom_frame_widget.dart';
import 'package:reubro_machin_test/core/mesurment/reponsive_size.dart';
import 'package:reubro_machin_test/core/router/route_names.dart';
import 'package:reubro_machin_test/core/theme/app_color/app_color.dart';
import 'package:reubro_machin_test/core/theme/text/app_text.dart';
import 'package:reubro_machin_test/core/utils/ui_utils.dart';
import 'package:reubro_machin_test/features/feedback/widget/custom_feedback_paint.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFrameWidget(
      child: Center(
        child: CustomPaint(
          painter: OuterShapePainter(),
          child: SizedBox(
            width: 350.rw(context),
            height: 600.rh(context),
            child: Padding(
              padding: EdgeInsets.all(18.rf(context)),
              child: Column(
                spacing: 35.rh(context),
                children: [
                  Uiutils.getTextWidget(
                    context,
                    'HOW ARE YOU FEELING?',
                    textStyle: TextStyleType.mediumbold,
                  ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Uiutils.getTextWidget(
                        context,
                        '''PLEASE
SELECT
  ONEE''',
                        textStyle: TextStyleType.largeBold,
                        maxline: 3,
                        color: AppColors.kYellowColor,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20.rw(context)),

                        child: Column(
                          spacing: 16.rh(context),
                          children: List.generate(
                            AppConstants.feedback.length,
                            (index) => GestureDetector(
                              onTap: () =>
                                  context.pushNamed(RouteNames.menu),
                              child: CustomPaint(
                                painter: RobotFramePainter(),

                                child: SizedBox(
                                  width: 145.rw(context),
                                  child: Padding(
                                    padding: EdgeInsets.all(18.rf(context)),
                                    child: Column(
                                      children: [
                                        Uiutils.getassetImage(
                                          ImageConstants.robot,
                                        ),
                                        Uiutils.getTextWidget(
                                          context,
                                          AppConstants.feedback[index],
                                          color: AppColors.kYellowColor,
                                          fs: 13.rf(context),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
