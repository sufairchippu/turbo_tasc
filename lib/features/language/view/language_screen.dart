import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:reubro_machin_test/core/constants/app_constants.dart';
import 'package:reubro_machin_test/core/constants/widgets/custom_frame_widget.dart';
import 'package:reubro_machin_test/core/mesurment/reponsive_size.dart';
import 'package:reubro_machin_test/core/router/route_names.dart';
import 'package:reubro_machin_test/core/theme/app_color/app_color.dart';
import 'package:reubro_machin_test/core/theme/text/app_text.dart';
import 'package:reubro_machin_test/core/utils/ui_utils.dart';
import 'package:reubro_machin_test/features/language/controller/language_provider.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFrameWidget(
      child: Column(
        children: [
          SizedBox(height: 40.rh(context)),

          Uiutils.getTextWidget(
            context,
            'SLEEP ME',
            textStyle: TextStyleType.heading,
            color: AppColors.kDarkBlue,
            fs: 35.rf(context),
          ),
          SizedBox(height: 25.rh(context)),
          Uiutils.getTextWidget(
            context,
            'SELECT   YOUR\n  LAUNGUAGE',
            textStyle: TextStyleType.subHeading,
          ),
          SizedBox(height: 60.rh(context)),
          SizedBox(
            height: 400.rh(context),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 90.rh(context),
                crossAxisSpacing: 80.rw(context),
              ),
              itemCount: AppConstants.language.length,
              itemBuilder: (context, index) {
                final item = AppConstants.language[index];
                return Consumer<LanguageProvider>(
                  builder: (context, state, child) => GestureDetector(
                    onTap: () {
                      state.changeLanguage(item);
                    },
                    child: Uiutils.getTextWidget(
                      context,
                      item,
                      textStyle: TextStyleType.smallBold,
                      color: item == state.selectedLanguage
                          ? AppColors.kWhite
                          : null,
                    ),
                  ),
                );
              },
            ),
          ),

          if (context.watch<LanguageProvider>().selectedLanguage != '') ...[
            Uiutils.getTextWidget(
              context,
              'YOU HAVE SELECTED',
              textStyle: TextStyleType.subHeading,
            ),
            Consumer<LanguageProvider>(
              builder: (context, state, child) {
                return Uiutils.getTextWidget(
                  context,
                  state.selectedLanguage,
                  color: AppColors.kWhite,
                  textStyle: TextStyleType.subHeading,
                );
              },
            ),
            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => context.pushNamed(RouteNames.plan),
                  child: Uiutils.getTextWidget(
                    context,
                    'CONDIEM >>',
                    color: AppColors.kWhite,
                    textStyle: TextStyleType.subHeading,
                  ),
                ),
              ],
            ),
          ],
          SizedBox(height: 30.rh(context)),
        ],
      ),
    );
  }
}
