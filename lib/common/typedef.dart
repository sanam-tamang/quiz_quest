
import 'package:dartz/dartz.dart';
import 'package:quiz_quest/core/failure/failure.dart';


typedef FutureEither<Type> = Future<Either<Failure, Type>>;
