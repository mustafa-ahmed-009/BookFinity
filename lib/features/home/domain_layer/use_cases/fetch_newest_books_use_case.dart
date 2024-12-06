import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/use_case.dart';
import 'package:bookly/features/home/domain_layer/entities/book_entity.dart';
import 'package:bookly/features/home/domain_layer/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchNewestdBooksUseCase extends UseCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;

  FetchNewestdBooksUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call(
      {required String topic, int pageNumber = 0}) async {
    return await homeRepo.fetchFeaturedBooks(
        topic: topic, pageNumber: pageNumber); 
  }
}
