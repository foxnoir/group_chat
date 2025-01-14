import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:group_chat/core/log/logger.dart';
import 'package:group_chat/core/theme/theme.dart';
import 'package:group_chat/features/router/app_router.dart';

Future<void> main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await _loadApp();
  }, (Object error, StackTrace stack) {
    logger.e('zone error $error', error, stack);
  });
}

Future<void> _loadApp() async {
  try {
    runApp(GroupChatApp());
  } catch (ex, st) {
    logger.e('startup exception', ex, st);
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
      routeInformationParser: appRouter.routeInformationParser,
      routeInformationProvider: appRouter.routeInformationProvider,
      routerDelegate: appRouter.routerDelegate,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      // Todo: add locale
      // locale: DI.getIt<SettingsRepository>().locale,
      theme: getLightTheme(),
    );
  }
}
