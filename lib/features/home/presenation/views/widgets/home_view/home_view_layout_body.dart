import 'package:bookly/core/functions/show_error_snack_bar.dart';
import 'package:bookly/core/utils/app_styles.dart';
import 'package:bookly/features/home/presenation/manager/cubit/newest_books_cubit.dart';
import 'package:bookly/features/home/presenation/views/widgets/custom_app_bar.dart';
import 'package:bookly/features/home/presenation/views/widgets/home_view/home_view_grid_view_builder.dart';
import 'package:bookly/features/home/presenation/views/widgets/home_view/home_view_list_view_bloc_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewLayoutBody extends StatefulWidget {
  const HomeViewLayoutBody({
    super.key,
    required this.crossAxisCount,
    required this.SearchIconSize,
    required this.logoHeight,
  });
  final int crossAxisCount;
  final double SearchIconSize;
  final double logoHeight;

  @override
  State<HomeViewLayoutBody> createState() => _HomeViewLayoutBodyState();
}

class _HomeViewLayoutBodyState extends State<HomeViewLayoutBody> {
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
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(
                  searchIconSize: widget.SearchIconSize,
                  logoHeight: widget.logoHeight,
                ),
                const HomeViewListViewBlocBuilder(),
                Text(
                  "Best Seller",
                  style: AppStyles.styleSemiBold24(context),
                ),
              ],
            ),
          ),
        ),
        HomeViewGridViewBuilder(crossAxisCount: widget.crossAxisCount),
      ],
    );
  }
}
      //  BlocConsumer<NewestBooksCubit, NewestBooksState>(
      //             listener: (context, state) {},
      //             builder: (context, state) {
      //               return SliverGrid(
      //                 delegate: SliverChildBuilderDelegate((context, index) {
      //                   Text("some data");
      //                 }),
      //                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //                   crossAxisCount: 2,
      //                   crossAxisSpacing: 5,
      //                   mainAxisSpacing: 5,
      //                   mainAxisExtent: MediaQuery.sizeOf(context).height * 0.2,
      //                 ),
      //               );
      //             },
      //           )