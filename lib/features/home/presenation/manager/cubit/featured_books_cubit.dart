
import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/domain_layer/entities/book_entity.dart';
import 'package:bookly/features/home/domain_layer/use_cases/fetch_featured_books_use_case.dart';
import 'package:meta/meta.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit({required this.featuredBooksUseCase})
      : super(FeaturedBooksInitial());
  final FetchFeaturedBooksUseCase featuredBooksUseCase;
  Future<void> fetchFeaturedBook(
      {int pageNumber = 0, required String topic}) async {
    if (pageNumber == 0) {
      emit(FeaturedBooksLoading());
    } else {
      emit(FeaturedBooksPaginationLoading());
    }
    var result = await featuredBooksUseCase.call(pageNumber: pageNumber, topic: topic);
    result.fold((failure) {
      emit(FeaturedBooksFailure(errorMessage: failure.message));
    }, (books) {
      emit(FeaturedBooksSuccess(books: books));
    });
  }
}
