import 'package:japanese_tutorials_app/core/utils/type_defs.dart';

abstract class OnBoardingRepo {
  const OnBoardingRepo();

  ResultFutureVoid cacheFirstTimer();

  Result<bool> checkIfUserIsFirstTimer();
}
