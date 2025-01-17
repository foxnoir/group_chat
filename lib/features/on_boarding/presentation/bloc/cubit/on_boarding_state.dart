part of 'on_boarding_cubit.dart';

sealed class OnBoardingState extends Equatable {
  const OnBoardingState();

  @override
  List<Object> get props => [];
}

final class OnBoardingInitial extends OnBoardingState {
  const OnBoardingInitial();
}

class CachingFirstTimer extends OnBoardingState {
  const CachingFirstTimer();
}

class CheckingUserIsFirstTimer extends OnBoardingState {
  const CheckingUserIsFirstTimer();
}

class UserCached extends OnBoardingState {
  const UserCached();
}

class OnBoardingsStatus extends OnBoardingState {
  const OnBoardingsStatus({required this.isFirstTimer});
  final bool isFirstTimer;

  @override
  List<bool> get props => [isFirstTimer];
}

class OnBoardingError extends OnBoardingState {
  const OnBoardingError({required this.message});
  final String message;

  @override
  List<String> get props => [message];
}
