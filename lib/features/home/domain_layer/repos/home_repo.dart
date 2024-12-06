import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/features/home/domain_layer/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks(
      {int pageNumber = 0  , required String topic});
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks( {int pageNumber = 0  , required String topic});
}