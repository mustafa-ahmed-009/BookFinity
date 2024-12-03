import 'package:bookly/features/search/presentation/views/widgets/search_view_main_layout.dart';
import 'package:flutter/cupertino.dart';

class SearchViewTabletLayout extends StatelessWidget {
  const SearchViewTabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const SearchViewMainLayout(crossAxisCount: 1); 
  }
}
