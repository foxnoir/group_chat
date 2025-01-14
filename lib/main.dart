import 'dart:async';
import 'package:flutter/material.dart';
import 'package:group_chat/core/log/logger.dart';
import 'package:group_chat/core/theme/theme.dart';

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
    return MaterialApp(
      title: 'Group Chat App',
      theme: getLightTheme(),
    );
  }
}
