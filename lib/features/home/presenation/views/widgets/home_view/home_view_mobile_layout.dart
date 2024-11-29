import 'package:bookly/features/home/presenation/views/widgets/custom_app_bar.dart';
import 'package:bookly/features/home/presenation/views/widgets/home_view/home_view_featured_list_view_item.dart';
import 'package:bookly/features/home/presenation/views/widgets/home_view/home_view_layout_body.dart';
import 'package:flutter/cupertino.dart';

class HomeViewMobileLayout extends StatelessWidget {
  const HomeViewMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeViewLayoutBody(
      crossAxisCount: 1,
      SearchIconSize: 24,
      logoHeight: 24,
    );
  }
}
