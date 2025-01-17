import 'package:dartz/dartz.dart';
import 'package:japanese_tutorials_app/core/errors/failures.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;

typedef ResultFutureVoid = ResultFuture<void>;

typedef Result<T> = Either<Failure, T>;

typedef DataMap = Map<String, dynamic>;
