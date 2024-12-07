part of 'newest_books_cubit.dart';

@immutable
 class NewestBooksState {}

 class NewestBooksInitial extends NewestBooksState {}

class  NewestBooksLoading extends NewestBooksState {}
class NewestBooksPaginationLoading extends NewestBooksState {}

class NewestBooksPaginationFailure extends NewestBooksState {
  final String errorMessage;

  NewestBooksPaginationFailure(this.errorMessage);
}
class  NewestBooksFailure extends NewestBooksState {
  final String errorMessage;

   NewestBooksFailure({required this.errorMessage});
}

class  NewestBooksSuccess extends NewestBooksState {
  final List<BookEntity> books;

   NewestBooksSuccess({required this.books}); 
}
