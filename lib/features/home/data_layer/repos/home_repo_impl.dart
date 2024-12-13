import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/features/home/data_layer/data_sources/home_local_data_source.dart';
import 'package:bookly/features/home/data_layer/data_sources/home_remote_data_source.dart';
import 'package:bookly/features/home/domain_layer/entities/book_entity.dart';
import 'package:bookly/features/home/domain_layer/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource remoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl(
      {required this.remoteDataSource, required this.homeLocalDataSource});
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks(
      {int pageNumber = 0, required String topic}) async {
    try {
      var booksList = homeLocalDataSource.fetchFeaturedBooks(
          pageNumber: pageNumber); //local
      if (booksList.isNotEmpty) {
        return right(booksList);
      }
      var books = await remoteDataSource.fetchFeaturedBooks(
          topic: topic, pageNumber: pageNumber); // remote
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks(
      {int pageNumber = 0, required String topic}) async {
    try {
      var booksList = homeLocalDataSource.fetchNewestBooks(
        pageNumber: pageNumber,
      );
      if (booksList.isNotEmpty) {
        return right(booksList);
      }
      var books = await remoteDataSource.fetchNewestBooks(
          pageNumber: pageNumber, topic: topic);
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
