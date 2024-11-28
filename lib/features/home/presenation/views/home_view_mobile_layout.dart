import 'package:bookly/features/home/presenation/views/widgets/custom_app_bar.dart';
import 'package:bookly/features/home/presenation/views/widgets/home_view_featured_list_view_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class HomeViewMobileLayout extends StatelessWidget {
  const HomeViewMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomAppBar(
          searchIconSize: 24,
          logoHeight: 24,
        ),
        HomeViewFeaturedListViewItem()
      ],
    );
  }
}
