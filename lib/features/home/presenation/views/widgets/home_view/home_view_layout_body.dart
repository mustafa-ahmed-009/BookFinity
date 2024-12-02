import 'package:bookly/core/utils/app_styles.dart';
import 'package:bookly/features/home/presenation/manager/cubit/newest_books_cubit.dart';
import 'package:bookly/features/home/presenation/views/widgets/custom_app_bar.dart';
import 'package:bookly/features/home/presenation/views/widgets/home_view/home_view_grid_view.dart';
import 'package:bookly/features/home/presenation/views/widgets/home_view/home_view_grid_view_builder.dart';
import 'package:bookly/features/home/presenation/views/widgets/home_view/home_view_grid_view_item.dart';
import 'package:bookly/features/home/presenation/views/widgets/home_view/home_view_list_view_bloc_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewLayoutBody extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(
                  searchIconSize: SearchIconSize,
                  logoHeight: logoHeight,
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
          SliverFillRemaining(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: HomeViewGridViewBuilder(crossAxisCount: crossAxisCount,),
          ),
        ),
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