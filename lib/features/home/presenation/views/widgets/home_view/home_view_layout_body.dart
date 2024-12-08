import 'package:bookly/core/utils/app_styles.dart';
import 'package:bookly/features/home/presenation/manager/cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presenation/manager/cubit/newest_books_cubit.dart';
import 'package:bookly/features/home/presenation/manager/cubit/shared_data_cubit.dart';
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
    required this.serachIconSize,
    required this.logoHeight,
  });
  final int crossAxisCount;
  final double serachIconSize;
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
    context.read<NewestBooksCubit>().fetchNewestBooks(
        topic: BlocProvider.of<SharedDataCubit>(context).topic);
    context.read<FeaturedBooksCubit>().fetchFeaturedBook(
        topic: BlocProvider.of<SharedDataCubit>(context).topic);
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() async {
    var currentPositions = _scrollController.position.pixels;
    var maxScrollLength = _scrollController.position.maxScrollExtent;
    if (currentPositions >= 0.7 * maxScrollLength) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<NewestBooksCubit>(context).fetchNewestBooks(
            pageNumber: nextPage++,
            topic: BlocProvider.of<SharedDataCubit>(context).topic);
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
                  searchIconSize: widget.serachIconSize,
                  logoHeight: widget.logoHeight,
                ),
                Center(
                  child: Text(
                    "Most Popular books in ${BlocProvider.of<SharedDataCubit>(context).topic}",
                    style: AppStyles.styleSemiBold24(context),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const HomeViewListViewBlocBuilder(),
                const SizedBox(
                  height: 5,
                ),
                Center(
                  child: Text(
                    "Newest Books in ${BlocProvider.of<SharedDataCubit>(context).topic}",
                    style: AppStyles.styleSemiBold24(context),
                  ),
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
