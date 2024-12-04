import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/domain_layer/entities/book_entity.dart';
import 'package:bookly/features/home/domain_layer/use_cases/fetch_newest_books_use_case.dart';
import 'package:meta/meta.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit({required this.fetchNewestdBooksUseCase})
      : super(NewestBooksInitial());
  final FetchNewestdBooksUseCase fetchNewestdBooksUseCase;
  BookEntity bookEntity = BookEntity(
    bookPreviewLink: "",
      authorName: "",
      bookId: "",
      image: "",
      price: 0,
      rating: 33,
      title: "",
      ratingCount: 0);
  Future<void> fetchNewestBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(NewestBooksLoading());
    } else {
      emit(NewestBooksPaginationLoading());
    }
    var result = await fetchNewestdBooksUseCase.call(pageNumber);
    result.fold((failure) {
      emit(NewestBooksFailure(errorMessage: failure.message));
    }, (books) {
      emit(NewestBooksSuccess(books: books));
    });
  }
}
