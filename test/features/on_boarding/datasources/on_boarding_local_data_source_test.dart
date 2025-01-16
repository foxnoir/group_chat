import 'package:flutter_test/flutter_test.dart';
import 'package:japanese_tutorials_app/core/errors/exceptions.dart';
import 'package:japanese_tutorials_app/features/on_boarding/datasources/on_boarding_local_data_source.dart';
import 'package:japanese_tutorials_app/features/storage/prefs.dart';
import 'package:mocktail/mocktail.dart';

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

  setUpAll(() {
    registerFallbackValue(PrefsKey.isFirstTimer);
  });

  setUp(() {
    _prefs = MockPrefs();
    _localDataSource = OnBoardingLocalDataSrcImpl(_prefs);
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

        _localDataSource.cacheFirstTimer();

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
}
