import 'package:bookly/features/home/presenation/views/widgets/home_view/home_view_layout_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeViewDesktopLayout extends StatelessWidget {
  const HomeViewDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeViewLayoutBody(
      crossAxisCount: 2,
      serachIconSize: 52,
      logoHeight: 52,
    );
  }
}
