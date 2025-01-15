import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:japanese_tutorials_app/core/di/di.dart';
import 'package:japanese_tutorials_app/core/log/logger.dart';
import 'package:japanese_tutorials_app/features/on_boarding/presentation/on_boarding_screen.dart';
import 'package:japanese_tutorials_app/features/router/app_router_names.dart';
import 'package:japanese_tutorials_app/features/router/page_not_found.dart';
import 'package:japanese_tutorials_app/features/router/transiton_page.dart';
import 'package:injectable/injectable.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

@singleton
class AppRouter {
  AppRouter({required this.isTesting});
  final bool isTesting;
  GoRouter router([String? initialLocation]) => GoRouter(
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

GoRouter get router => DI.getIt<AppRouter>().router();

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
  /// Custom function to navigate to a specific route with parameters
  void popUntilPath({required String routePath}) {
    while (router.location != routePath) {
      if (!router.canPop()) {
        return;
      }
      logger.info('Popping ${router.location}');
      router.pop();
    }
  }
}
