import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:group_chat/core/log/logger.dart';
import 'package:group_chat/features/on_boarding/presentation/on_boarding_screen.dart';
import 'package:group_chat/features/router/app_router_names.dart';
import 'package:group_chat/features/router/page_not_found.dart';
import 'package:group_chat/features/router/transiton_page.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  AppRouter({required this.isTesting});
  final bool isTesting;
  static final GoRouter router = GoRouter(
    initialLocation: AppRouteNames.initialLocation,
    navigatorKey: navigatorKey,
    errorBuilder: (context, state) => const PageNotFound(),
    routes: [
      ShellRoute(
        pageBuilder: (context, state, child) => TransitionPage(
          key: state.pageKey,
          child: Scaffold(
            body: child,
          ),
        ),
        routes: [
          GoRoute(
            path: AppRouteNames.home,
            name: AppRouteNames.home,
            pageBuilder: (context, state) => TransitionPage(
              key: state.pageKey,
              child: const OnBoardingScreen(),
            ),
            routes: const [],
          ),
        ],
      ),
    ],
  );
}

extension GoRouterLocation on GoRouter {
  String get location {
    final lastMatch = Platform.environment.containsKey('FLUTTER_TEST')
        ? RouteMatch(
            route: GoRoute(
              path: AppRouteNames.home,
              name: AppRouteNames.home,
              pageBuilder: (context, state) => SlideTransitionPage(
                key: state.pageKey,
                child: const OnBoardingScreen(),
              ),
            ),
            pageKey: const ValueKey('routeTesting'),
            matchedLocation: '',
          )
        : routerDelegate.currentConfiguration.last;
    final matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}

extension GoRouterExtension on GoRouter {
  // Custom function to navigate to a specific route with parameters
  void popUntilPath({required String routePath}) {
    while (AppRouter.router.location != routePath) {
      if (!AppRouter.router.canPop()) {
        return;
      }
      logger.info('Popping ${AppRouter.router.location}');
      AppRouter.router.pop();
    }
  }
}
