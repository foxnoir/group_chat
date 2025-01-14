import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:group_chat/core/di/di.dart';
import 'package:group_chat/core/log/logger.dart';
import 'package:group_chat/core/theme/theme.dart';
import 'package:group_chat/features/router/app_router.dart';
import 'package:injectable/injectable.dart';

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
    await configureInjection(Environment.dev);
    runApp(GroupChatApp());
  } catch (ex, st) {
    logger.error('startup exception', error: ex, stackTrace: st);
  }
}

class GroupChatApp extends StatelessWidget {
  factory GroupChatApp() => instance;
  const GroupChatApp._internal();

  static const GroupChatApp instance = GroupChatApp._internal();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: AppRouter.router.routeInformationParser,
      routeInformationProvider: AppRouter.router.routeInformationProvider,
      routerDelegate: AppRouter.router.routerDelegate,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      // TODO(Noir): add locale
      // locale: DI.getIt<SettingsRepository>().locale,
      theme: getLightTheme(),
    );
  }
}
