import 'package:flutter_test/flutter_test.dart';
import 'package:japanese_tutorials_app/features/on_boarding/datasources/on_boarding_local_data_source.dart';
import 'package:japanese_tutorials_app/features/storage/prefs.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.mock.dart';

void main() {
  late Prefs _prefs;
  late OnBoardingLocalDataSource _localDataSource;

  setUpAll(() {
    // Registriere eine Fallback-Value für PrefsKey
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

        await _localDataSource.cacheFirstTimer();

        verify(() => _prefs.setBool(key: PrefsKey.isFirstTimer, value: false))
            .called(1);
        verifyNoMoreInteractions(_prefs);
      },
    );
  });
}
