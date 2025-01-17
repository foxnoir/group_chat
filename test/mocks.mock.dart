import 'package:japanese_tutorials_app/features/on_boarding/data/data_sources/on_boarding_local_data_source.dart';
import 'package:japanese_tutorials_app/features/on_boarding/domain/repos/on_boarding_repo.dart';
import 'package:japanese_tutorials_app/features/storage/prefs.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockOnBoardingLocalDataSrc extends Mock
    implements OnBoardingLocalDataSource {}

class MockOnBoardingRepo extends Mock implements OnBoardingRepo {}

class MockPrefs extends Mock implements Prefs {}

class MockSharedPreferences extends Mock implements SharedPreferences {}
