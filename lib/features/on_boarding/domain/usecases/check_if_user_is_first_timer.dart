import 'package:japanese_tutorials_app/core/usecases/usecases.dart';
import 'package:japanese_tutorials_app/core/utils/type_defs.dart';
import 'package:japanese_tutorials_app/features/on_boarding/domain/repos/on_boarding_repo.dart';

class CheckIfUserIsFirstTimer extends UsecaseWithoutParams<bool> {
  const CheckIfUserIsFirstTimer(this._repo);

  final OnBoardingRepo _repo;

  @override
  ResultFuture<bool> call() async => _repo.checkIfUserIsFirstTimer();
}
