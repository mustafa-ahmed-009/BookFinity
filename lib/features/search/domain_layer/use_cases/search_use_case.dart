import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/use_case.dart';
import 'package:bookly/features/home/domain_layer/entities/book_entity.dart';
import 'package:bookly/features/search/domain_layer/repo/search_repo.dart';
import 'package:dartz/dartz.dart';

class SearchUseCaseImp implements SearchUseCaseArch<List<BookEntity>> {
  final SearchRepo searchRepo;

  SearchUseCaseImp({required this.searchRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call({required String serachParams}) async {
    return await searchRepo.getSearchResults(searchParams: serachParams);
  }
}