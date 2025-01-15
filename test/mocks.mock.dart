import 'package:japanese_tutorials_app/features/on_boarding/datasources/on_boarding_local_data_source.dart';
import 'package:japanese_tutorials_app/features/on_boarding/domain/repos/on_boarding_repo.dart';
import 'package:mocktail/mocktail.dart';

class MockOnBoardingLocalDataSrc extends Mock
    implements OnBoardingLocalDataSource {}

class MockOnBoardingRepo extends Mock implements OnBoardingRepo {}
