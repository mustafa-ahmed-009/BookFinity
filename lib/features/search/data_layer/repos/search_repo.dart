import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/features/home/domain_layer/entities/book_entity.dart';
import 'package:bookly/features/search/data_layer/data_sources/remote_search_data_source.dart';
import 'package:bookly/features/search/domain_layer/repo/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo {
  final RemoteSearchDataSource remoteSearchDataSource;

  SearchRepoImpl({required this.remoteSearchDataSource});
  @override
  Future<Either<Failure, List<BookEntity> >> getSearchResults(
      {required searchParams}) async{
      try {
           List<BookEntity>  books = await  remoteSearchDataSource.fetchSearchResults(searchParams: searchParams); 

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
