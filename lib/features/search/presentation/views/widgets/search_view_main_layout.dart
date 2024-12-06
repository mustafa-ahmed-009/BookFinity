import 'package:bookly/features/search/presentation/cubits/cubit/search_cubit_cubit.dart';
import 'package:bookly/features/search/presentation/views/widgets/search_view_app_bar.dart';
import 'package:bookly/features/search/presentation/views/widgets/search_view_grid_view_builder.dart';
import 'package:bookly/features/search/presentation/views/widgets/wrapping_in_the_middle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewMainLayout extends StatefulWidget {
  const SearchViewMainLayout({super.key, required this.crossAxisCount});
  final int crossAxisCount;

  @override
  State<SearchViewMainLayout> createState() => _SearchViewMainLayoutState();
}

class _SearchViewMainLayoutState extends State<SearchViewMainLayout> {
  late final ScrollController _scrollController;
  var nextPage = 1;

  var isLoading = false;
  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() async {
    var currentPositions = _scrollController.position.pixels;
    var maxScrollLength = _scrollController.position.maxScrollExtent;
    if (currentPositions >= 0.7 * maxScrollLength) {
      if (!isLoading) {
        final String searchParams =
            BlocProvider.of<SearchViewCubit>(context).searchParams;
        isLoading = true;
        await BlocProvider.of<SearchViewCubit>(context).fetchSearchResults(
            searchParams: searchParams, pageNumber: nextPage++);
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        controller: _scrollController,
        slivers: [
          const SearchViewAppBar(),
          BlocBuilder<SearchViewCubit, SearchCubitState>(
            builder: (context, state) {
              if (state is SearchCubitInitial) {
                return const WrappingInMiddleInsideCustomScrollViewWidget(
                  text: "Oops there are no data to show Please search First",
                );
              } else {
                return const SliverToBoxAdapter(
                  child: SizedBox(),
                );
              }
            },
          ),
          SearchViewGridBuilder(crossAxisCount: widget.crossAxisCount)
        ],
      ),
    );
  }
}
