import 'package:bookly/features/home/presenation/views/widgets/home_view/home_view_layout_body.dart';
import 'package:flutter/cupertino.dart';

class HomeViewMobileLayout extends StatelessWidget {
  const HomeViewMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeViewLayoutBody(
      crossAxisCount: 1,
      SearchIconSize: 24,
      logoHeight: 24,
    );
  }
}
