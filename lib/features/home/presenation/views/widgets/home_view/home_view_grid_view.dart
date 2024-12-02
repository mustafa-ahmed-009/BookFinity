import 'package:bookly/features/home/domain_layer/entities/book_entity.dart';
import 'package:bookly/features/home/presenation/manager/cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presenation/manager/cubit/newest_books_cubit.dart';
import 'package:bookly/features/home/presenation/views/widgets/home_view/home_view_grid_view_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewGridView extends StatefulWidget {
  const HomeViewGridView(
      {super.key, required this.crossAxisCount, required this.books});
  final int crossAxisCount;
  final List<BookEntity> books;

  @override
  State<HomeViewGridView> createState() => _HomeViewGridViewState();
}

class _HomeViewGridViewState extends State<HomeViewGridView> {
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
        await BlocProvider.of<NewestBooksCubit>(context)
            .fetchNewestBooks(pageNumber: nextPage++);
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
    return GridView.builder(
        controller: _scrollController,
        itemCount: widget.books.length,
        physics: const BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: widget.crossAxisCount,
          crossAxisSpacing: 5,
          mainAxisSpacing: 3,
          mainAxisExtent: MediaQuery.sizeOf(context).height * 0.2, // height
        ),
        itemBuilder: (context, index) {
          return HomeViewGridBuilderItem(
            book: widget.books[index],
          );
        });
  }
}
