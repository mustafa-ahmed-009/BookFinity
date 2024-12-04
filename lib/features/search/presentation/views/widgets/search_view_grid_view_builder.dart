import 'package:bookly/core/functions/show_error_snack_bar.dart';
import 'package:bookly/features/home/domain_layer/entities/book_entity.dart';
import 'package:bookly/features/home/presenation/manager/cubit/newest_books_cubit.dart';
import 'package:bookly/features/home/presenation/views/widgets/home_view/home_view_grid_view_item.dart';
import 'package:bookly/features/search/presentation/cubits/cubit/search_cubit_cubit.dart';
import 'package:bookly/features/search/presentation/views/widgets/search_view_builder_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewGridBuilder extends StatefulWidget {
  const SearchViewGridBuilder({super.key, required this.crossAxisCount});
  final int crossAxisCount;
  @override
  State<SearchViewGridBuilder> createState() => _SearchViewGridBuilderState();
}

class _SearchViewGridBuilderState extends State<SearchViewGridBuilder> {
  List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchViewCubit, SearchCubitState>(
      listener: (context, state) {
        if (state is SearchCubitSuccess) {
          books = BlocProvider.of<SearchViewCubit>(context).mybooks;
        }
      },
      builder: (context, state) {
        return SliverGrid.builder(
            itemCount: books.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: widget.crossAxisCount,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              mainAxisExtent: MediaQuery.sizeOf(context).height * 0.2,
            ),
            itemBuilder: (context, index) {
              if (state is SearchCubitSuccess) {
                return SearchViewGridBuilderItem(
                  book: books[index],
                );
              } else if (state is SearchCubitFailure) {
                return Text(state.errorMessage);
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            });
      },
    );
  }
}
