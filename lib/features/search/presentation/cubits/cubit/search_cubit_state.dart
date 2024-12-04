part of 'search_cubit_cubit.dart';

@immutable
class SearchCubitState {}

class SearchCubitInitial extends SearchCubitState {}

class SearchCubitLoading extends SearchCubitState {}

class SearchCubitSuccess extends SearchCubitState {}

class SearchCubitFailure extends SearchCubitState {
  final String errorMessage;

  SearchCubitFailure({required this.errorMessage}); 
}
