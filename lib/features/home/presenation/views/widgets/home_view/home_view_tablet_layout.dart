import 'package:bookly/features/home/presenation/views/widgets/home_view/home_view_layout_body.dart';
import 'package:flutter/cupertino.dart';

class HomeViewTabletLayout extends StatelessWidget {
  const HomeViewTabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeViewLayoutBody(
      crossAxisCount: 1,
      serachIconSize: 34,
      logoHeight: 34,
    );
  }
}
