import 'package:bookly/features/home/presenation/views/widgets/home_view/home_view_grid_view.dart';
import 'package:bookly/features/search/presentation/views/widgets/search_view_app_bar.dart';
import 'package:flutter/cupertino.dart';

class SearchViewTabletLayout extends StatelessWidget {
  const SearchViewTabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SearchViewAppBar(),
        Expanded(child: HomeViewGridView(crossAxisCount: 1))
      ],
    );
  }
}
