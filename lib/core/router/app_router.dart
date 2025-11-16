import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:reubro_machin_test/core/router/route_names.dart';
import 'package:reubro_machin_test/core/utils/custom_transition_page.dart';
import 'package:reubro_machin_test/features/feedback/view/feedback_screen.dart';
import 'package:reubro_machin_test/features/language/view/language_screen.dart';
import 'package:reubro_machin_test/features/menu/view/menu_screen.dart';
import 'package:reubro_machin_test/features/paln/view/plan_screen.dart';
import 'package:reubro_machin_test/features/welcome/view/welcome_screeen.dart';
import 'package:reubro_machin_test/features/welcome/view/welcome_screen2.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: '/language',
  routes: <RouteBase>[
    //! Login Screen with Slide from Right
    GoRoute(
      path: '/language',
      name: RouteNames.language,
      pageBuilder: (context, state) => customBuildTransitionPage(
        child: const LanguageScreen(),
        state: state,
        type: TransitionType.slideFromRight,
      ),
      routes: [
        GoRoute(
          path: 'plan',
          name: RouteNames.plan,
          pageBuilder: (context, state) => customBuildTransitionPage(
            child: const PlanScreen(),
            state: state,
            type: TransitionType.slideFromRight,
          ),
        ),
        GoRoute(
          path: 'feedback',
          name: RouteNames.feedback,
          pageBuilder: (context, state) => customBuildTransitionPage(
            child: const FeedbackScreen(),
            state: state,
            type: TransitionType.slideFromRight,
          ),
        ),
        GoRoute(
          path: 'menu',
          name: RouteNames.menu,
          pageBuilder: (context, state) => customBuildTransitionPage(
            child: const MenuScreen(),
            state: state,
            type: TransitionType.slideFromRight,
          ),
        ),
        GoRoute(
          path: 'welcome',
          name: RouteNames.welcome,
          pageBuilder: (context, state) => customBuildTransitionPage(
            child: const WelcomeScreeen(),
            state: state,
            type: TransitionType.slideFromRight,
          ),
        ),
        GoRoute(
          path: 'welcome2',
          name: RouteNames.welcome2,
          pageBuilder: (context, state) => customBuildTransitionPage(
            child: const WelcomeScreen2(),
            state: state,
            type: TransitionType.slideFromRight,
          ),
        ),
      ],
    ),
  ],
);
