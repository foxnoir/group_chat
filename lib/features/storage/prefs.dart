// ignore_for_file: avoid_positional_boolean_parameters

import 'package:japanese_tutorials_app/core/di/di.dart';
import 'package:japanese_tutorials_app/core/log/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum PrefsKey {
  isFirstTimer,
}

class Prefs {
  /// default value for tokenSetting
  static const String devBaseURLDefault = '---';
  static const bool isQADeviceDefault = false;

  static final SharedPreferences _sharedPreferences =
      DI.getIt<SharedPreferences>();

  /// prefix for settingsKey to prevent mixing Datatypes
  static String prefixString = 's';
  static String prefixStringList = 'sl';

  /// prefix for settingsKey to prevent mixing Datatypes
  static String prefixInt = 'i';

  /// prefix for settingsKey to prevent mixing Datatypes
  static String prefixBool = 'b';

  /// prefix for settingsKey to prevent mixing Datatypes
  static String prefixDouble = 'd';

  /// clears all values, only use when it is necessary
  static void clear() {
    if (!const bool.fromEnvironment('dart.vm.product')) {
      const prefsKeys = PrefsKey.values;
      // TODO(Noir): write better clear logic
      // for (final key in prefsKeys) {
      //   if (key != PrefsKey.devBaseURL) {
      //     final prefsKeyString = '$prefixString$key';
      //     _sharedPreferences.remove(prefsKeyString);
      //   } else {
      //     _sharedPreferences.clear();
      //   }
      // }
    }
  }

  /// resets all userData / settings after logging out or similar
  static void reset() {}

  static void putString(PrefsKey key, String value) {
    _sharedPreferences.setString('$prefixString$key', value);
  }

  static void putInt(PrefsKey key, int value) {
    _sharedPreferences.setInt('$prefixInt$key', value);
  }

  static void putDouble(PrefsKey key, double value) {
    _sharedPreferences.setDouble('$prefixDouble$key', value);
  }

  static void putBool(PrefsKey key, bool value) {
    _sharedPreferences.setBool('$prefixBool$key', value);
  }

  static String? getString(PrefsKey key, String? defaultValue) {
    var res = defaultValue;
    if (_sharedPreferences.containsKey('$prefixString$key')) {
      res = _sharedPreferences.getString('$prefixString$key') ?? defaultValue;
    }
    return res;
  }

  static List<String> getStringList(PrefsKey key, List<String> defaultValue) {
    var res = defaultValue;
    if (_sharedPreferences.containsKey('$prefixStringList$key')) {
      res = _sharedPreferences.getStringList('$prefixStringList$key') ??
          defaultValue;
    }
    return res;
  }

  static void putStringList(PrefsKey key, List<String> value) {
    _sharedPreferences.setStringList('$prefixStringList$key', value);
  }

  static int getInt(PrefsKey key, int defaultValue) {
    var res = defaultValue;
    if (_sharedPreferences.containsKey('$prefixInt$key')) {
      res = _sharedPreferences.getInt('$prefixInt$key') ?? defaultValue;
    }
    return res;
  }

  static double getDouble(PrefsKey key, double defaultValue) {
    var res = defaultValue;
    if (_sharedPreferences.containsKey('$prefixDouble$key')) {
      res = _sharedPreferences.getDouble('$prefixDouble$key') ?? defaultValue;
    }
    return res;
  }

  static bool getBool(PrefsKey key, bool defaultValue) {
    var res = defaultValue;
    if (_sharedPreferences.containsKey('$prefixBool$key')) {
      res = _sharedPreferences.getBool('$prefixBool$key') ?? defaultValue;
    }

    return res;
  }

  static String cleanKey(PrefsKey key) {
    return key.toString().split('.')[1];
  }

  static void removeStringOption(PrefsKey key) {
    _sharedPreferences.remove('$prefixString$key');
  }

  static void removeIntOption(PrefsKey key) {
    _sharedPreferences.remove('$prefixInt$key');
  }

  static void removeBoolOption(PrefsKey key) {
    _sharedPreferences.remove('$prefixBool$key');
  }

  static void removeDoubleOption(PrefsKey key) {
    _sharedPreferences.remove('$prefixDouble$key');
  }

  static Future<void> printAllValues() async {
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
