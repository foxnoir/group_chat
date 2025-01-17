import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:japanese_tutorials_app/features/on_boarding/domain/usecases/cache_first_timer.dart';
import 'package:japanese_tutorials_app/features/on_boarding/domain/usecases/check_if_user_is_first_timer.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit({
    required CacheFirstTimer cacheFirstTimer,
    required CheckIfUserIsFirstTimer checkUserIsFirstTimer,
  })  : _cacheFirstTimer = cacheFirstTimer,
        __checkUserIsFirstTimer = checkUserIsFirstTimer,
        super(const OnBoardingInitial());

  final CacheFirstTimer _cacheFirstTimer;
  final CheckIfUserIsFirstTimer __checkUserIsFirstTimer;
}
