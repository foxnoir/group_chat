import 'package:japanese_tutorials_app/core/errors/exceptions.dart';
import 'package:japanese_tutorials_app/features/storage/prefs.dart';

/// Data Source:
/// - Responsible for low-level data operations, such as interacting with APIs,
///   databases, or local storage (e.g., SharedPreferences).
/// - Uses `Future` to return raw data or throw exceptions.
/// - Keeps the implementation simple and focused only on data access,
///   without handling errors or business logic.
/// - Error handling is deferred to higher layers (e.g., the repository).

abstract class OnBoardingLocalDataSource {
  const OnBoardingLocalDataSource();

  void cacheFirstTimer();

  bool checkIfUserIsFirstTimer();
}

class OnBoardingLocalDataSrcImpl extends OnBoardingLocalDataSource {
  const OnBoardingLocalDataSrcImpl(this._prefs);

  final Prefs _prefs;

  @override
  void cacheFirstTimer() {
    try {
      _prefs.setBool(key: PrefsKey.isFirstTimer, value: false);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  bool checkIfUserIsFirstTimer() {
    throw UnimplementedError();
  }
}
