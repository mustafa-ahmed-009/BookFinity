import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/domain_layer/entities/book_entity.dart';
import 'package:bookly/features/search/domain_layer/use_cases/search_use_case.dart';
import 'package:meta/meta.dart';

part 'search_cubit_state.dart';

class SearchViewCubit extends Cubit<SearchCubitState> {
  SearchViewCubit({required this.searchUseCaseImp})
      : super(SearchCubitInitial());
  final SearchUseCaseImp searchUseCaseImp;
  List<BookEntity> mybooks = [];
  String searchParams = "";
  Future<void> fetchSearchResults(
      {required String searchParams, int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(SearchCubitLoading());
    } else {
      emit(SearchCubitPaginationLoading());
    }
    var result = await searchUseCaseImp.call(
        serachParams: searchParams, pageNumber: pageNumber);
    result.fold((failure) {
      emit(SearchCubitFailure(errorMessage: failure.message));
    }, (books) {
      mybooks = books;
      if (pageNumber == 0) {
        emit(SearchCubitSuccess());
      } else {
        emit(SearchCubitPaginationSuccess());
      }
    });
  }

  void emitInitial() {
    emit(SearchCubitInitial());
  }
}
