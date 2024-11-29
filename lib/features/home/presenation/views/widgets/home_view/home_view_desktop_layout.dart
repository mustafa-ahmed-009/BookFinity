import 'package:bookly/core/utils/app_styles.dart';
import 'package:bookly/features/home/presenation/views/widgets/custom_app_bar.dart';
import 'package:bookly/features/home/presenation/views/widgets/home_view/home_view_featured_list_view.dart';
import 'package:bookly/features/home/presenation/views/widgets/home_view/home_view_featured_list_view_item.dart';
import 'package:bookly/features/home/presenation/views/widgets/home_view/home_view_grid_view.dart';
import 'package:bookly/features/home/presenation/views/widgets/home_view/home_view_layout_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeViewDesktopLayout extends StatelessWidget {
  const HomeViewDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeViewLayoutBody(crossAxisCount: 2,
    SearchIconSize: 52,
    logoHeight: 52,);
  }
}
