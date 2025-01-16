// ignore_for_file: aFuture<void>_positional_boolean_parameter asyncs

import 'package:japanese_tutorials_app/core/di/di.dart';
import 'package:japanese_tutorials_app/core/log/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum PrefsKey {
  isFirstTimer,
}

class Prefs {
  Prefs._();

  /// default value for tokenSetting
  static const String devBaseURLDefault = '---';
  static const bool isQADeviceDefault = false;

  final SharedPreferences _sharedPreferences = DI.getIt<SharedPreferences>();

  /// prefix for settingsKey to prevent mixing Datatypes
  String prefixString = 's';
  String prefixStringList = 'sl';

  /// prefix for settingsKey to prevent mixing Datatypes
  String prefixInt = 'i';

  /// prefix for settingsKey to prevent mixing Datatypes
  String prefixBool = 'b';

  /// prefix for settingsKey to prevent mixing Datatypes
  String prefixDouble = 'd';

  /// clears all values, only use when it is necessary
  Future<void> clear() async {
    if (!const bool.fromEnvironment('dart.vm.product')) {
      const prefsKeys = PrefsKey.values;
      // TODO(Noir): write better clear logic
      // for (final key in prefsKeys) {
      //   if (key != PrefsKey.devBaseURL) {
      //     final prefsKeyString = '$prefixString$key';
      // await    _sharedPreferences.remove(prefsKeyString);
      //   } else {
      // await    _sharedPreferences.clear();
      //   }
      // }
    }
  }

  Future<void> setString({required PrefsKey key, required String value}) async {
    await _sharedPreferences.setString('$prefixString$key', value);
  }

  Future<void> setInt({required PrefsKey key, required int value}) async {
    await _sharedPreferences.setInt('$prefixInt$key', value);
  }

  Future<void> setDouble({required PrefsKey key, required double value}) async {
    await _sharedPreferences.setDouble('$prefixDouble$key', value);
  }

  Future<void> setBool({required PrefsKey key, required bool value}) async {
    await _sharedPreferences.setBool('$prefixBool$key', value);
  }

  String? getString({required PrefsKey key, required String? defaultValue}) {
    var result = defaultValue;
    if (_sharedPreferences.containsKey('$prefixString$key')) {
      result =
          _sharedPreferences.getString('$prefixString$key') ?? defaultValue;
    }
    return result;
  }

  List<String>? getStringList({
    required PrefsKey key,
    required List<String> defaultValue,
  }) {
    var result = defaultValue;
    if (_sharedPreferences.containsKey('$prefixStringList$key')) {
      result = _sharedPreferences.getStringList('$prefixStringList$key') ??
          defaultValue;
    }
    return result;
  }

  Future<void> setStringList({
    required PrefsKey key,
    required List<String> value,
  }) async {
    await _sharedPreferences.setStringList('$prefixStringList$key', value);
  }

  int getInt({required PrefsKey key, required int defaultValue}) {
    var result = defaultValue;
    if (_sharedPreferences.containsKey('$prefixInt$key')) {
      result = _sharedPreferences.getInt('$prefixInt$key') ?? defaultValue;
    }
    return result;
  }

  double getDouble({required PrefsKey key, required double defaultValue}) {
    var result = defaultValue;
    if (_sharedPreferences.containsKey('$prefixDouble$key')) {
      result =
          _sharedPreferences.getDouble('$prefixDouble$key') ?? defaultValue;
    }
    return result;
  }

  bool getBool({required PrefsKey key, required bool defaultValue}) {
    var result = defaultValue;
    if (_sharedPreferences.containsKey('$prefixBool$key')) {
      result = _sharedPreferences.getBool('$prefixBool$key') ?? defaultValue;
    }

    return result;
  }

  String cleanKey({required PrefsKey key}) {
    return key.toString().split('.')[1];
  }

  Future<void> removeStringOption({required PrefsKey key}) async {
    await _sharedPreferences.remove('$prefixString$key');
  }

  Future<void> removeIntOption({required PrefsKey key}) async {
    await _sharedPreferences.remove('$prefixInt$key');
  }

  Future<void> removeBoolOption({required PrefsKey key}) async {
    await _sharedPreferences.remove('$prefixBool$key');
  }

  Future<void> removeDoubleOption({required PrefsKey key}) async {
    await _sharedPreferences.remove('$prefixDouble$key');
  }

  Future<void> printAllValues() async {
    const keys = PrefsKey.values;
    final values = <PrefsKey, dynamic>{};

    for (final key in keys) {
      if (_sharedPreferences.containsKey('$prefixString$key')) {
        values[key] = _sharedPreferences.getString('$prefixString$key');
      } else if (_sharedPreferences.containsKey('$prefixStringList$key')) {
        values[key] = _sharedPreferences.getStringList('$prefixStringList$key');
      } else if (_sharedPreferences.containsKey('$prefixInt$key')) {
        values[key] = _sharedPreferences.getInt('$prefixInt$key');
      } else if (_sharedPreferences.containsKey('$prefixBool$key')) {
        values[key] = _sharedPreferences.getBool('$prefixBool$key');
      } else if (_sharedPreferences.containsKey('$prefixDouble$key')) {
        values[key] = _sharedPreferences.getDouble('$prefixDouble$key');
      }
    }

    logger.info('All stored values:');
    values.forEach((key, value) {
      logger.info('$key: $value');
    });
  }
}
