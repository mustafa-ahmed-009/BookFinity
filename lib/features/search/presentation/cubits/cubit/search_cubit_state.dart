part of 'search_cubit_cubit.dart';

@immutable
class SearchCubitState {}

class SearchCubitInitial extends SearchCubitState {}

class SearchCubitLoading extends SearchCubitState {}

class SearchCubitPaginationLoading extends SearchCubitState {}

class SearchCubitSuccess extends SearchCubitState {}

class SearchCubitDeviceChanged extends SearchCubitState {}

class SearchCubitPaginationFailure extends SearchCubitState {
  final String errorMessage;

  SearchCubitPaginationFailure({required this.errorMessage});
}

class SearchCubitPaginationSuccess extends SearchCubitState {}

class SearchCubitFailure extends SearchCubitState {
  final String errorMessage;

  SearchCubitFailure({required this.errorMessage});
}
