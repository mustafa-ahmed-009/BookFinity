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
  Future<void> fetchSearchResults({required String searchParams}) async {
    emit(SearchCubitLoading());
    var result = await searchUseCaseImp.call(serachParams: searchParams);
    result.fold((failure) {
      emit(SearchCubitFailure(errorMessage: failure.message));
    }, (books) {
      mybooks = books;
      emit(SearchCubitSuccess());
    });
  }

  void emitInitial() {
    emit(SearchCubitInitial()); 
  }
}
