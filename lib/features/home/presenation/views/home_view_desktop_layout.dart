import 'package:bookly/core/utils/app_styles.dart';
import 'package:bookly/features/home/presenation/views/widgets/custom_app_bar.dart';
import 'package:bookly/features/home/presenation/views/widgets/home_view_featured_list_view.dart';
import 'package:bookly/features/home/presenation/views/widgets/home_view_featured_list_view_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeViewDesktopLayout extends StatelessWidget {
  const HomeViewDesktopLayout({super.key});

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
                const CustomAppBar(
                  searchIconSize: 52,
                  logoHeight: 52,
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
          child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 4,
                mainAxisExtent:
                    MediaQuery.sizeOf(context).height * 0.2, // height
              ),
              itemBuilder: (context, index) {
                return HomeViewGridBuilderItem();
              }),
        ),
      ],
    );
  }
}

class HomeViewGridBuilderItem extends StatelessWidget {
  const HomeViewGridBuilderItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            child: SizedBox(
                height: MediaQuery.sizeOf(context).height * .3,
                child: HomeViewFeaturedListViewItem()),
          ),
          Expanded(
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Fanzhendong vs Truls Morgarid paris olympics finals"),
                Text("BookAuthor"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("price"),
                    Text("Ratings "),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
