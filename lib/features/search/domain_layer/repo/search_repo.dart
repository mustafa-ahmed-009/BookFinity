import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/features/home/domain_layer/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo   {
   Future<Either<Failure, List<BookEntity>  >> getSearchResults({required searchParams});
}