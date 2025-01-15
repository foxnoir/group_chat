import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:japanese_tutorials_app/core/errors/exceptions.dart';
import 'package:japanese_tutorials_app/core/errors/failures.dart';
import 'package:japanese_tutorials_app/features/on_boarding/data/repos/on_boarding_repo_impl.dart';
import 'package:japanese_tutorials_app/features/on_boarding/domain/repos/on_boarding_repo.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.mock.dart';

void main() {
  late MockOnBoardingLocalDataSrc _localDataSource;
  late OnBoardingRepoImpl _repoImpl;

  setUp(() {
    _localDataSource = MockOnBoardingLocalDataSrc();
    _repoImpl = OnBoardingRepoImpl(_localDataSource);
  });

  test('should be a subclass of [OnBoardingRepo]', () {
    expect(_repoImpl, isA<OnBoardingRepo>());
  });

  group('cacheFirstTimer', () {
    test(
      'should complete successfully when call to local source is successful',
      () async {
        when(() => _localDataSource.cacheFirstTimer()).thenAnswer(
          (_) async => Future.value(),
        );

        final result = await _repoImpl.cacheFirstTimer();

        expect(result, equals(const Right<dynamic, void>(null)));
        verify(() => _localDataSource.cacheFirstTimer()).called(1);
        verifyNoMoreInteractions(_localDataSource);
      },
    );

    test(
      'should return [CacheFailure] when call to local source is '
      'unsuccessful',
      () async {
        when(() => _localDataSource.cacheFirstTimer()).thenThrow(
          const CacheException(message: 'Insufficient storage'),
        );

        final result = await _repoImpl.cacheFirstTimer();

        expect(
          result,
          Left<CacheFailure, dynamic>(
            CacheFailure(message: 'Insufficient storage'),
          ),
        );
        verify(() => _localDataSource.cacheFirstTimer()).called(1);
        verifyNoMoreInteractions(_localDataSource);
      },
    );
  });

  group('checkIfUserIsFirstTimer', () {
    test(
      'should return true when user is first timer',
      () async {
        when(() => _localDataSource.checkIfUserIsFirstTimer()).thenAnswer(
          (_) async => true,
        );

        final result = await _repoImpl.checkIfUserIsFirstTimer();

        expect(result, equals(const Right<dynamic, bool>(true)));
        verify(() => _localDataSource.checkIfUserIsFirstTimer());
        verifyNoMoreInteractions(_localDataSource);
      },
    );

    test(
      'should return true when user is first timer',
      () async {
        when(() => _localDataSource.checkIfUserIsFirstTimer()).thenAnswer(
          (_) async => false,
        );

        final result = await _repoImpl.checkIfUserIsFirstTimer();

        expect(result, equals(const Right<dynamic, bool>(false)));
        verify(() => _localDataSource.checkIfUserIsFirstTimer());
        verifyNoMoreInteractions(_localDataSource);
      },
    );
  });

  group('checkIfUserIsFirstTimer', () {
    test(
      'should return true when user is first timer',
      () async {
        when(() => _localDataSource.checkIfUserIsFirstTimer())
            .thenAnswer((_) async => Future.value(true));

        final result = await _repoImpl.checkIfUserIsFirstTimer();

        expect(result, equals(const Right<dynamic, bool>(true)));

        verify(() => _localDataSource.checkIfUserIsFirstTimer()).called(1);

        verifyNoMoreInteractions(_localDataSource);
      },
    );

    test(
      'should return false when user is not first timer',
      () async {
        when(() => _localDataSource.checkIfUserIsFirstTimer())
            .thenAnswer((_) async => Future.value(false));

        final result = await _repoImpl.checkIfUserIsFirstTimer();

        expect(result, equals(const Right<dynamic, bool>(false)));

        verify(() => _localDataSource.checkIfUserIsFirstTimer()).called(1);

        verifyNoMoreInteractions(_localDataSource);
      },
    );

    test(
      'should return a CacheFailure when call to local data source '
      'is unsuccessful',
      () async {
        when(() => _localDataSource.checkIfUserIsFirstTimer()).thenThrow(
          const CacheException(
            message: 'Insufficient permissions',
            statusCode: 403,
          ),
        );

        final result = await _repoImpl.checkIfUserIsFirstTimer();

        expect(
          result,
          equals(
            Left<CacheFailure, bool>(
              CacheFailure(
                message: 'Insufficient permissions',
                statusCode: 403,
              ),
            ),
          ),
        );

        verify(() => _localDataSource.checkIfUserIsFirstTimer()).called(1);

        verifyNoMoreInteractions(_localDataSource);
      },
    );
  });
}
