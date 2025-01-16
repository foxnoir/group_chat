import 'package:flutter_test/flutter_test.dart';
import 'package:japanese_tutorials_app/core/errors/exceptions.dart';
import 'package:japanese_tutorials_app/features/on_boarding/datasources/on_boarding_local_data_source.dart';
import 'package:japanese_tutorials_app/features/storage/prefs.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../mocks.mock.dart';

/// This test ensures that the `cacheFirstTimer` method:
/// - Interacts with the `Prefs` dependency to store the "first timer" status.
/// - Calls the `setBool` method with the correct parameters
/// (`PrefsKey.isFirstTimer` and `false`).
/// - Does not invoke any unexpected interactions with the `Prefs` mock.
///
/// The test uses `verify` and `verifyNoMoreInteractions` from Mocktail:
/// - `verify`: Confirms that the specific method was called with the
///    correct arguments.
/// - `verifyNoMoreInteractions`: Ensures no other interactions with the mock
///    occurred.
///
/// Since `verify` acts as an assertion, no explicit `expect` is required.

void main() {
  late Prefs _prefs;
  late OnBoardingLocalDataSource _localDataSource;
  late SharedPreferences _sharedPrefs;

  setUpAll(() {
    registerFallbackValue(PrefsKey.isFirstTimer);
  });

  setUp(() {
    _prefs = MockPrefs();
    _localDataSource = OnBoardingLocalDataSrcImpl(_prefs);
    _sharedPrefs = MockSharedPreferences();
  });

  group('cacheFirstTimer', () {
    test(
      'should call [SharedPreferences] to cache the data',
      () async {
        when(
          () => _prefs.setBool(
            key: any(named: 'key'),
            value: any(named: 'value'),
          ),
        ).thenAnswer((_) async => true);

        await _localDataSource.cacheFirstTimer();

        verify(() => _prefs.setBool(key: PrefsKey.isFirstTimer, value: false))
            .called(1);
        verifyNoMoreInteractions(_prefs);
      },
    );

    test(
      'should throw a [CacheException] when there is an error caching the data',
      () async {
        when(
          () => _prefs.setBool(
            key: any(named: 'key'),
            value: any(named: 'value'),
          ),
        ).thenThrow(
          const CacheException(message: 'Insufficient storage'),
        );

        final methodCall = _localDataSource.cacheFirstTimer;

        expect(methodCall, throwsA(isA<CacheException>()));

        verify(() => _prefs.setBool(key: PrefsKey.isFirstTimer, value: false))
            .called(1);
        verifyNoMoreInteractions(_prefs);
      },
    );
  });

  group('checkIfUserIsFirstTimer', () {
    test(
      /// if data doesn't exist, user is a first timer
      /// thenReturn instead of thenAnswer cause it's not a future
      'should call [SharedPreferences] to check if user is a first timer '
      'return the right response from storage when data exists',
      () async {
        when(
          () => _prefs.getBool(
            key: any(named: 'key'),
            defaultValue: any(named: 'defaultValue'),
          ),
        ).thenReturn(false);

        final result = _localDataSource.checkIfUserIsFirstTimer();
        expect(result, false);

        verify(
          () => _prefs.getBool(key: PrefsKey.isFirstTimer, defaultValue: true),
        ).called(1);
        verifyNoMoreInteractions(_prefs);
      },
    );

    test(
      'should call [SharedPreferences] to check if user is a first timer '
      'return true if there is no data in storage',
      () async {
        when(
          () => _prefs.getBool(
            key: any(named: 'key'),
            defaultValue: any(named: 'defaultValue'),
          ),
        ).thenReturn(true);

        final result = _localDataSource.checkIfUserIsFirstTimer();
        final savedValue = _sharedPrefs.getString('${PrefsKey.isFirstTimer}');
        if (savedValue == null) {
          expect(result, true);
        }
        verify(
          () => _prefs.getBool(key: PrefsKey.isFirstTimer, defaultValue: true),
        ).called(1);
        verifyNoMoreInteractions(_prefs);
      },
    );

    test(
      'should throw a [CacheException] when there is an error '
      'retrierving the data',
      () async {
        when(
          () => _prefs.getBool(
            key: any(named: 'key'),
            defaultValue: any(named: 'defaultValue'),
          ),
        ).thenThrow(
          const CacheException(message: 'Insufficient storage'),
        );

        final methodCall = _localDataSource.checkIfUserIsFirstTimer;

        expect(methodCall, throwsA(isA<CacheException>()));

        verify(
          () => _prefs.getBool(key: PrefsKey.isFirstTimer, defaultValue: true),
        ).called(1);
        verifyNoMoreInteractions(_prefs);
      },
    );
  });
}
