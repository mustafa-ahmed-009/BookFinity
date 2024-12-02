import 'package:bookly/features/home/presenation/views/widgets/home_view/home_view_grid_view_builder.dart';
import 'package:bookly/features/search/presentation/views/widgets/search_view_app_bar.dart';
import 'package:flutter/material.dart';

class SearchViewMainLayout extends StatelessWidget {
  const SearchViewMainLayout({super.key, required this.crossAxisCount});
  final int crossAxisCount; 
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Column(
        children: [
          const SearchViewAppBar(),
          Expanded(child: HomeViewGridViewBuilder(crossAxisCount: crossAxisCount))
        ],
      ),
    );
  }
}
