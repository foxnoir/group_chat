// ignore_for_file: avoid_positional_boolean_parameters

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
  void clear() {
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

  void setString({required PrefsKey key, required String value}) {
    _sharedPreferences.setString('$prefixString$key', value);
  }

  void setInt({required PrefsKey key, required int value}) {
    _sharedPreferences.setInt('$prefixInt$key', value);
  }

  void setDouble({required PrefsKey key, required double value}) {
    _sharedPreferences.setDouble('$prefixDouble$key', value);
  }

  void setBool({required PrefsKey key, required bool value}) {
    _sharedPreferences.setBool('$prefixBool$key', value);
  }

  String? getString({required PrefsKey key, required String? defaultValue}) {
    var res = defaultValue;
    if (_sharedPreferences.containsKey('$prefixString$key')) {
      res = _sharedPreferences.getString('$prefixString$key') ?? defaultValue;
    }
    return res;
  }

  List<String> getStringList({
    required PrefsKey key,
    required List<String> defaultValue,
  }) {
    var res = defaultValue;
    if (_sharedPreferences.containsKey('$prefixStringList$key')) {
      res = _sharedPreferences.getStringList('$prefixStringList$key') ??
          defaultValue;
    }
    return res;
  }

  void setStringList({required PrefsKey key, required List<String> value}) {
    _sharedPreferences.setStringList('$prefixStringList$key', value);
  }

  int getInt({required PrefsKey key, required int defaultValue}) {
    var res = defaultValue;
    if (_sharedPreferences.containsKey('$prefixInt$key')) {
      res = _sharedPreferences.getInt('$prefixInt$key') ?? defaultValue;
    }
    return res;
  }

  double getDouble({required PrefsKey key, required double defaultValue}) {
    var res = defaultValue;
    if (_sharedPreferences.containsKey('$prefixDouble$key')) {
      res = _sharedPreferences.getDouble('$prefixDouble$key') ?? defaultValue;
    }
    return res;
  }

  bool getBool({required PrefsKey key, required bool defaultValue}) {
    var res = defaultValue;
    if (_sharedPreferences.containsKey('$prefixBool$key')) {
      res = _sharedPreferences.getBool('$prefixBool$key') ?? defaultValue;
    }

    return res;
  }

  String cleanKey({required PrefsKey key}) {
    return key.toString().split('.')[1];
  }

  void removeStringOption({required PrefsKey key}) {
    _sharedPreferences.remove('$prefixString$key');
  }

  void removeIntOption({required PrefsKey key}) {
    _sharedPreferences.remove('$prefixInt$key');
  }

  void removeBoolOption({required PrefsKey key}) {
    _sharedPreferences.remove('$prefixBool$key');
  }

  void removeDoubleOption({required PrefsKey key}) {
    _sharedPreferences.remove('$prefixDouble$key');
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
