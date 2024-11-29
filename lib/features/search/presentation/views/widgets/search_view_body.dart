import 'package:bookly/core/adaptive_layout.dart';
import 'package:bookly/features/search/presentation/views/widgets/search_view_deskop_layout.dart';
import 'package:bookly/features/search/presentation/views/widgets/search_view_phone_layout.dart';
import 'package:bookly/features/search/presentation/views/widgets/search_view_tablet_layout.dart';
import 'package:flutter/cupertino.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
        mobileLayout: (context) => const SearchViewPhoneLayout(),
        tableLayout: (context) => const SearchViewTabletLayout(),
        desktopLayout: (context) => const SearchViewDeskopLayout());
  }
}
