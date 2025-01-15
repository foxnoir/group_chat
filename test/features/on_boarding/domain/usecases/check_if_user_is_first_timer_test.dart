// Unit Test file for check_if_user_is_first_timer.dart

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:japanese_tutorials_app/features/on_boarding/domain/usecases/check_if_user_is_first_timer.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.mock.dart';

void main() {
  late MockOnBoardingRepo _repo;
  late CheckIfUserIsFirstTimer _usecase;

  setUp(() {
    _repo = MockOnBoardingRepo();
    _usecase = CheckIfUserIsFirstTimer(_repo);
  });

  test(
    'should get a response from the [MockOnBoardingRepo]',
    () async {
      when(() => _repo.checkIfUserIsFirstTimer()).thenAnswer(
        (_) async => const Right(true),
      );

      final result = await _usecase();

      expect(result, equals(const Right<dynamic, bool>(true)));
      verify(() => _repo.checkIfUserIsFirstTimer()).called(1);
      verifyNoMoreInteractions(_repo);
    },
  );
}
