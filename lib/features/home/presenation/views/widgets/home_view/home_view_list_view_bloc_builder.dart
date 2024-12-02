import 'package:bookly/core/functions/show_error_snack_bar.dart';
import 'package:bookly/features/home/domain_layer/entities/book_entity.dart';
import 'package:bookly/features/home/presenation/manager/cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presenation/views/widgets/home_view/home_view_featured_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewListViewBlocBuilder extends StatefulWidget {
  const HomeViewListViewBlocBuilder({
    super.key,
  });

  @override
  State<HomeViewListViewBlocBuilder> createState() =>
      _HomeViewListViewBlocBuilderState();
}

class _HomeViewListViewBlocBuilderState
    extends State<HomeViewListViewBlocBuilder> {
  List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksSuccess) {
          books.addAll(state.books);
        }

        if (state is FeaturedBooksPaginationFailure) {
          showErrorSnackbar(context, state.errMessage); 
        }
      },
      builder: (context, state) {
      if (state is FeaturedBooksSuccess ||
            state is FeaturedBooksPaginationLoading ||
            state is FeaturedBooksPaginationFailure) {
          return HomeViewFeaturedListView(
            books: books,
          );
        } else if (state is FeaturedBooksFailure) {
          return Text(state.errorMessage);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
