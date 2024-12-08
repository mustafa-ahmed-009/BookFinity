import 'package:bookly/features/home/domain_layer/entities/book_entity.dart';
import 'package:bookly/features/search/presentation/cubits/cubit/search_cubit_cubit.dart';
import 'package:bookly/features/search/presentation/views/widgets/search_view_grid_view.dart';
import 'package:bookly/features/search/presentation/views/widgets/wrapping_in_the_middle.dart';
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
    return BlocBuilder<SearchViewCubit, SearchCubitState>(
      builder: (context, state) {
        if (state is SearchCubitSuccess || state is SearchCubitDeviceChanged) {
          books = BlocProvider.of<SearchViewCubit>(context).mybooks;
          return SearchVIewGridViewBuilder(books: books, widget: widget);
        }
         else if (state is SearchCubitPaginationSuccess ||
            state is SearchCubitPaginationLoading) {
          books += BlocProvider.of<SearchViewCubit>(context).mybooks;
          return SearchVIewGridViewBuilder(books: books, widget: widget);
        } 
        else if (state is SearchCubitFailure ||
            state is SearchCubitPaginationFailure) {
          return const WrappingInMiddleInsideCustomScrollViewWidget(
              text: "unfortunately there are no data matching your search");
        } else {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
