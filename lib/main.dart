import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:injectable/injectable.dart';
import 'package:japanese_tutorials_app/core/di/di.dart';
import 'package:japanese_tutorials_app/core/log/logger.dart';
import 'package:japanese_tutorials_app/core/theme/theme.dart';
import 'package:japanese_tutorials_app/features/router/app_router.dart';

Future<void> main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await _loadApp();
  }, (Object error, StackTrace stack) {
    logger.info('zone error $error');
  });
}

Future<void> _loadApp() async {
  try {
    await DI.getIt.reset();
    DI.getIt.registerSingleton<bool>(false);
    await configureInjection(Environment.dev);
    runApp(JapanesTutorialApp());
  } catch (ex, st) {
    logger.error('startup exception', error: ex, stackTrace: st);
  }
}

class JapanesTutorialApp extends StatelessWidget {
  factory JapanesTutorialApp() => instance;
  const JapanesTutorialApp._internal();

  static const JapanesTutorialApp instance = JapanesTutorialApp._internal();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      localeResolutionCallback: (locale, supportedLocales) {
        if (locale == null) {
          return const Locale('en', '');
        }
        for (final supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode) {
            return supportedLocale;
          }
        }
        return const Locale('en', '');
      },

      /// TODO(Noir): add locale
      /// locale: DI.getIt<SettingsRepository>().locale,
      theme: getLightTheme(),
    );
  }
}
