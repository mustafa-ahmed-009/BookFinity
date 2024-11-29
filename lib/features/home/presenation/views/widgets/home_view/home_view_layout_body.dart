import 'package:bookly/core/utils/app_styles.dart';
import 'package:bookly/features/home/presenation/views/widgets/custom_app_bar.dart';
import 'package:bookly/features/home/presenation/views/widgets/home_view/home_view_featured_list_view.dart';
import 'package:bookly/features/home/presenation/views/widgets/home_view/home_view_grid_view.dart';
import 'package:flutter/cupertino.dart';

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
                const HomeViewFeaturedListView(),
                Text(
                  "Best Seller",
                  style: AppStyles.styleSemiBold24(context),
                ),
              ],
            ),
          ),
        ),
        SliverFillRemaining(
          child: HomeViewGridView(
            crossAxisCount: crossAxisCount,
          ),
        ),
      ],
    );
  }
}
