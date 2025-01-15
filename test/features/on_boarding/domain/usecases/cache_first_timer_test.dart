import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:japanese_tutorials_app/core/errors/failures.dart';
import 'package:japanese_tutorials_app/features/on_boarding/domain/repos/on_boarding_repo.dart';
import 'package:japanese_tutorials_app/features/on_boarding/domain/usecases/cache_first_timer.dart';
import 'package:mocktail/mocktail.dart';

import 'on_boarding_repo.mock.dart';

// This test verifies that the CacheFirstTimer usecase:
// 1. Calls the [cacheFirstTimer] method on the OnBoardingRepo.
// 2. Returns the correct result when a failure occurs (e.g., ServerFailure).
// 3. Ensures no additional interactions with the repository.
// Testing failures is crucial to confirm the usecase properly propagates
// errors and handles them consistently.

void main() {
  late OnBoardingRepo repo;
  late CacheFirstTimer usecase;

  setUp(() {
    repo = MockOnBoardingRepo();
    usecase = CacheFirstTimer(repo);
  });

  test(
    'should call the [OnBoardingRepo.cacheFirstTimer] '
    'and return the right data',
    () async {
      // arrange
      when(() => repo.cacheFirstTimer()).thenAnswer(
        (_) async => Left<Failure, dynamic>(
          ServerFailure(
            message: 'Unknown Error Occurred',
            statusCode: 500,
          ),
        ),
      );

      // act
      final result = await usecase();

      // assert
      expect(
        result,
        equals(
          Left<Failure, dynamic>(
            ServerFailure(
              message: 'Unknown Error Occurred',
              statusCode: 500,
            ),
          ),
        ),
      );
      verify(() => repo.cacheFirstTimer()).called(1);
      verifyNoMoreInteractions(repo);
    },
  );
}
