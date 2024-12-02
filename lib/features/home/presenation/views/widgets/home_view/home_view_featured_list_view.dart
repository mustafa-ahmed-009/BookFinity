import 'package:bookly/features/home/domain_layer/entities/book_entity.dart';
import 'package:bookly/features/home/presenation/manager/cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presenation/views/widgets/home_view/home_view_featured_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewFeaturedListView extends StatefulWidget {
  const HomeViewFeaturedListView({
    super.key, required this.books,
  });
  final List<BookEntity> books; 

  @override
  State<HomeViewFeaturedListView> createState() => _HomeViewFeaturedListViewState();
}

class _HomeViewFeaturedListViewState extends State<HomeViewFeaturedListView> {
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
        isLoading = true;
        await BlocProvider.of<FeaturedBooksCubit>(context)
            .fetchFeaturedBook(pageNumber: nextPage++);
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
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .32,
      child: ListView.builder(
        controller: _scrollController,
          scrollDirection: Axis.horizontal,
        itemCount: widget.books.length,
          itemBuilder: (context, index) {
            return  HomeViewFeaturedListViewItem(imageUrl: widget.books[index].image ?? "" ,);
          }),
    );
  }
}
