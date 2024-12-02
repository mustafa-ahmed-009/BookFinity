import 'package:bookly/core/functions/show_error_snack_bar.dart';
import 'package:bookly/features/home/domain_layer/entities/book_entity.dart';
import 'package:bookly/features/home/presenation/manager/cubit/newest_books_cubit.dart';
import 'package:bookly/features/home/presenation/views/widgets/home_view/home_view_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewGridViewBuilder extends StatefulWidget {
  const HomeViewGridViewBuilder({super.key, required this.crossAxisCount});
  final int crossAxisCount;
  @override
  State<HomeViewGridViewBuilder> createState() =>
      _HomeViewGridViewBuilderState();
}

class _HomeViewGridViewBuilderState extends State<HomeViewGridViewBuilder> {
  List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksState>(
        listener: (context, state) {
      if (state is NewestBooksSuccess) {
        books.addAll(state.books);
      }

      if (state is NewestBooksPaginationFailure) {
        showErrorSnackbar(context, state.errMessage);
      }
    }, builder: (context, state) {
      if (state is NewestBooksSuccess ||
          state is NewestBooksPaginationLoading ||
          state is NewestBooksPaginationFailure) {
        return HomeViewGridView(crossAxisCount: 2, books: books);
      } else if (state is NewestBooksFailure) {
        return Text(state.errorMessage);
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}
