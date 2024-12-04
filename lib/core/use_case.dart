
import 'package:bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Param> {
  Future<Either<Failure, Type>> call([Param param]);
}
abstract class SearchUseCaseArch<Type> {
  Future<Either<Failure, Type>> call({required String serachParams});
}
class NoParam {}